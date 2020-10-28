Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFM4X6AKGQEOOQMY4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CFD29CFB4
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 12:30:05 +0100 (CET)
Received: by mail-wr1-x43a.google.com with SMTP id i6sf1975051wrx.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 04:30:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603884605; cv=pass;
        d=google.com; s=arc-20160816;
        b=wNZ2ZYZdHq7PSEqkvU8BfKJ+pSbzccv63DJQmnPlHzwlCsOQlaIilRS8H18OjsAzZC
         R8yuj3vNUkeyshg07FDOb55Op3w1l7BIa7DWD4EWprfuEbAyuNd2Ol3kO2D7ZnSjpOpb
         9DlSpeSlV23Lx8z6k+d+0eQoQFeAre7fbyzFWhp4spQvguSTEi3+gSnxTF45rvECti1b
         f/NO+kvh4RDAkmWt9UFmY1Xg7xB2zmmdFKz6V/hdriUnXYW3bQHQNWTKrkeCMEKUytq9
         MJNRBo+Y3Uj5oqERWpczNF9738VBn3iqXZ6aNbBf4giKR38g+3T+liiK2oO7M42WVCKB
         1v+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=KjS8it/nIXYLRYIfuq3GixGHdXWogz0EGzOnDrpeAmI=;
        b=wcpJWtzh8gE3Wox+NxV0Vfckd17ZFAUQICdXSuNXlx5fWBcQDDQZXb2arwkdsmt3vu
         zmlv48ZU5ZmMJOzuG8T9Xit6fxNCy+S5yRFlk/gHMO3OUd294QzOVze30F2/q7ABLduQ
         tHv+/S+EEq2ldlV/o8bBLMwU0rhadJaU9B3LTYM0BvZyepT8dq7eFubHQBuORG0eBrcl
         v6PqN4gopHOQ8o2h/rUSBBqChdp/9wfkRGA47dSJTl1UJCZK6Lm8Sjn8texZ4yp0tvpJ
         n+4jgjKiYBcwhhFwD9xk5aaU5Zh36rOokkC5zvcF6M/JJUieTtkpmQdyBWqkiVtak8T4
         pVtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=KjS8it/nIXYLRYIfuq3GixGHdXWogz0EGzOnDrpeAmI=;
        b=gG/On6M+DODmhs3ydSq+Y0UmyXKOfad0Ax3foCfgjHcQwRYXSPExeEglWUy4KFWZ7W
         4bhEMZdLq6WVW4BM2LQ4wpDsW+3uPWrFnm+Ga010YT41oQe6Wexm96BBj/mXyUi+Law4
         S5sqjYzPqIj6kot/PsLra/mx0pPfaVc5AH1ewAHrXkcTfE9cY7hs5ILW9/xWCc+HiP5p
         6af7H5euw9v5WDaAG9BOlEorqt9g2nYqR4tC6B7NuyPVW+iEXU0E4VLI4aroHjUmF8UV
         Y5WERYjJB/Uz181KybPvwLjfL8XHH1B+aCTEWf7XCkPKKvLcu3uQP0wFDCJbyKTRQElT
         2tHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=KjS8it/nIXYLRYIfuq3GixGHdXWogz0EGzOnDrpeAmI=;
        b=ivgZuWffdUhTf0gaGEghA5lEFwYptkCxsM9kIVLwpg2x0U+4Q4mmdf31eobfGjo3y+
         E0Frqa6wDohdGTS5P9xJIhBSloRMGT1N8vctFBKorMqqHHTzMy4y1AOCRAzvogrAgb2T
         I1Fdr3HmYheleiIusttnvJjqSQLqzSJI1Nm/OD1mVfqZvointtw/DSaUtYDeBulkA61Z
         8yvIFntbOAfHN1h8kg2R64PEyR/42Qwrl/rxZ5GXYi4hqVfseXYt5cA3xZcyWJ+RKM2j
         KGyaK1/83Sjg6mMpUbN10hC1bQnCodd+9pT2Z908aJCHydMCmjAKff2PadsqjCkP6tnU
         mRbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531rZGqs1bRckxM9jMaRhBHbN/iPRy4hpEfRro7Cfo0mIkW8BATI
	G6s/LJEv9P8j4J+PcIh4uv8=
X-Google-Smtp-Source: ABdhPJyKXqQIvWAv6vOu6oAFaV6aXanc6Dz0BHqFZx4PVv1FR2lEPCw10Yr/12CkQxpc+qqnHQqGJQ==
X-Received: by 2002:adf:9043:: with SMTP id h61mr8594039wrh.237.1603884605127;
        Wed, 28 Oct 2020 04:30:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls3367418wrj.0.gmail; Wed, 28 Oct
 2020 04:30:04 -0700 (PDT)
X-Received: by 2002:adf:bacc:: with SMTP id w12mr8830681wrg.66.1603884604053;
        Wed, 28 Oct 2020 04:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603884604; cv=none;
        d=google.com; s=arc-20160816;
        b=e8O+6gDzvbxx4zvSNQZY+R1oCyINWQXowo58C1hSmKhYFX2SA2YI5PS8G03dgWzyVS
         mAj8g8JbE8sdUEYccwAboDfVgd4tLzPhuPhYCJbZOkyidbxEGBTTyPvBPNOB4b+i7iMQ
         maaYrKYz/yk4pwT0LhzTTaSaKDqkzS6JMJVBvfCnNe72HmzD4pJ+iWuqjaR3yZ3L426O
         ZGbcU/u0Lb0VZT0lj05AUOKB05Kk7uxtibzA1F7e88tC+7dhfZ4Ov8qtXVAOLIOuUCQg
         Id0Lg79NYNXm29CvVdzRwDp+aYVFfbx/cYX/CcLuHdItJAPHfAwX1I8JqzPiintVkCXc
         OXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=st48HanT7scN9Hz+koMxv0Azn44jtEe1BrsXhGdRjpE=;
        b=wmmM0jzbtVqjpxeELM/HKmKUDiwEX8Xf0XJTEr4qU3ti7IcU30RiRumAnS2ImCnb9E
         Jzdn+LRNo6YluS++qAFD/x6Dxr+1FEdNWrLCq5sXKuIgDjBWg2mbJ+6f2cPDtU8R4J9D
         1wfLTR/wYrE8Eb7H/OEA3ALWflBW6Xcrq9UjrVsV2NqBdH/eOpkZS8X3+4kFdEa0+2Z+
         oz7DYuK9qfbZr+SiWfRxQTzxDkpJA1wBeAv5lo1r0cFiYZBMF1PuizY1drFV0N+FdilS
         /lEBRBqAHAuTAkc1Nk9FW7Bfr8n1qvdjKjYXizatd6N9AKr2EQkizpdn8gQG2Sm5f5w3
         JbQA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o16si118728wrv.1.2020.10.28.04.30.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 04:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09SBU3ep003931
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Oct 2020 12:30:03 +0100
Received: from [167.87.42.1] ([167.87.42.1])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09SBU2I6021604;
	Wed, 28 Oct 2020 12:30:02 +0100
Subject: Re: [PATCH] arm64: pvu: Avoid failure in config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Cc: jailhouse-dev@googlegroups.com
References: <20201026195257.14398-1-nikhil.nd@ti.com>
 <a282f746-9eb7-eb5e-7c45-a45e795a74c3@siemens.com>
 <20201027192413.kngjt3exc3wesbfy@NiksLab>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <aa9db23e-5e3b-5656-367b-a387e04ba0a2@siemens.com>
Date: Wed, 28 Oct 2020 12:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201027192413.kngjt3exc3wesbfy@NiksLab>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

On 27.10.20 20:24, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 18:33-20201027, Jan Kiszka wrote:
>> On 26.10.20 20:52, 'Nikhil Devshatwar' via Jailhouse wrote:
>>> @@ -356,20 +362,15 @@ static int pvu_iommu_program_entries(struct cell *cell, u8 virtid)
>>>  			if (idx == 0 && i >= dev->num_entries) {
>>>  				/* Find next available TLB and chain to it */
>>>  				tlb_next = pvu_tlb_alloc(dev, virtid);
>>> -				if (tlb_next < 0)
>>> -					return -ENOMEM;
>>>  				pvu_tlb_chain(dev, tlbnum, tlb_next);
>>>  				pvu_tlb_enable(dev, tlbnum);
>>>  				tlbnum = tlb_next;
>>>  			}
>>>  
>>> -			ret = pvu_entry_write(dev, tlbnum, idx, ent);
>>> -			if (ret)
>>> -				return ret;
>>> +			pvu_entry_write(dev, tlbnum, idx, ent);
>>
>> But what if pvu_entry_write finds an issue? Are we fine with reporting
>> only and then simply continueing?
>>
> The failures in pvu_entry_write are defensive programming.
> To ensure that the hardware constraints are met.
> Here, the caller has ensured the constraints, so this won't fail.
> 
> I can either get rid of the checks or explain why it is okay to
> ignore the return value

Are the check run against an unlikely hardware state or against a
possibly invalid cell configuration?

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aa9db23e-5e3b-5656-367b-a387e04ba0a2%40siemens.com.
