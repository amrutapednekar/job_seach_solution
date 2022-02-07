module JobsHelper
    def is_job_owner?(job_user_id)
        return job_user_id == current_user.id
    end

    def is_already_applied(job_id)
        is_already_applied = UserAppliedJob.where(["user_id = ?, job_id = ? and status = ?", current_user.id, job_id, true ])
        unless is_already_applied.nil?
             return true
        else
            return false
        end
    end

end
