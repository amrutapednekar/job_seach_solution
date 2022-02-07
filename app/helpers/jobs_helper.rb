module JobsHelper
    def is_job_owner?(job_user_id)
        return job_user_id == current_user.id
    end

    def is_already_applied?(job_id)
        is_already_applied = UserAppliedJob.where(["user_id = ? and job_id = ?", current_user.id, job_id])
        if is_already_applied.blank?
             return false
        else
            return true
        end
    end

end
