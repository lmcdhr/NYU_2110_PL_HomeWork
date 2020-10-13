package body Msort is
    
    -- the array used in merge, will store the sorted elements
    -- will copy to A after the sorting is done
    res : array_to_sort;

    -- Merge procudure, will copy back to A in the end
    procedure Merge(A: in out array_to_sort; left, mid, right: integer) is
        start_left : integer := left;
        start_right : integer := mid+1;
        end_left : integer := mid;
        end_right : integer := right;
        res_cur : integer := left;

    begin
        res(left .. right) := A(left .. right);

        while start_left <= end_left and start_right <= end_right loop
            if A(start_left) < A(start_right) then
                res(res_cur) := A(start_left);
                start_left := start_left + 1;
                res_cur := res_cur + 1;
            else
                res(res_cur) := A(start_right);
                start_right := start_right + 1;
                res_cur := res_cur + 1;
            end if;
        end loop;

        while start_left <= end_left loop
            res(res_cur) := A(start_left);
            res_cur := res_cur + 1;
            start_left := start_left + 1;
        end loop;
        while start_right <= end_right loop
            res(res_cur) := A(start_right);
            res_cur := res_cur + 1;
            start_right := start_right + 1;
        end loop;

        for i in left .. right loop
            A(i) := res(i);
        end loop;

    end Merge;
        
    -- the Sort procudure, will call recursive tasks for concurrency merge sort
    procedure ConcurrentSort(A: in out array_to_sort; left, right: integer) is

        task type sort_task(from, to: integer) is
        end sort_task;

        task body sort_task is
        begin
            ConcurrentSort(A, from, to);
        end sort_task;
        
    begin
        if left < right then
            declare
                mid: integer := left + (right - left)/2;
            begin
                declare
                    task_sort_left : sort_task(left, mid);
                    task_sort_right : sort_task(mid+1, right);
                begin
                    null;
                end;
            Merge(A, left, mid, right);
            end;
        end if;
    end ConcurrentSort;

    -- preprocess procudure, will call the Sort procudure: ConcurrentSort
    procedure Sort(A : in out array_to_sort; LENGTH : in integer) is
        left : integer := A'first;
        right : integer := A'last;

    begin
        for i in 1 .. A'last loop
            res(i) := A(i);
        end loop;
        ConcurrentSort(A, left, right);
    end Sort;

end Msort;


