Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZG2T3ZQKGQEOQEICSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37A180134
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 16:08:21 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id g26sf512197wmk.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 08:08:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583852901; cv=pass;
        d=google.com; s=arc-20160816;
        b=OcdnrizN7zUMx3XXsW54eAhSM1KU1f6tTIA2r5uY07FRuv7Kl2z4L69F0EneqDIcAK
         brLPdCYegpe60eGvAN7oM1Cbr7kuCossUIHuIOXJUim0aGOmVq/zcsA1kNb5YBAfEBQY
         +tl9Nd7hJVxFxv8lVX4RALoSqsc9qbuB4qdK4SjZ40RNMcpAPUMLoiaSkjZvgWJ6m50I
         DB2xCM+eoViYLdM4ftsIxZUK20wNLbugC/15UuMVs5W2VVVQddm38PiCqKJRXLha3TI1
         BL1sepqDhcDFmm1y8TjOzm4th+/i5Ptg+Uk11BrWIgzvYFzKJTszmeUOUc/nTHDtn/ZV
         DPNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=jBd/k2Sq+O68/8EkFdD7ipz1iFg0ses9aQLVlkeNKU8=;
        b=wPUPkG6mU9Og+ae5yHM6Mlf3UGnhM9vhicI/B1yVUtTE7xgWcCFh/7sX+I+hzkm6/D
         Qk9PG21ef25rxOsfbKf2O2WkJ9dD1d1wMq/SlS1EsC+24kXZXaKvNwi8Q8ylMT/GOQQd
         i3C5blPLVB5h8CI/RXbNiFwNoUpIMTaDeNVPxfeQHI8/rAk7Zjsn/XXCMx8Q6+rDsZrK
         jSLr4Hef8wyc+0G2NaMyehJdwR2FCQ/Pczwk11RUC7MpzXSgFiSPtVyWf+yjYFGMqkA4
         CV+Pn9ra7X4JFe/GzOMzwukYfB8+oA+ZDVVImqY4U2/IJvGidu92YVmDZgjRvUj93ti1
         mKPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=jBd/k2Sq+O68/8EkFdD7ipz1iFg0ses9aQLVlkeNKU8=;
        b=J8llDAGVD/u1O+q/0a5UrQDcmefVt7PNynnWi/TbJvMgIZQNnvkkRxXGY0Z5ossCK1
         wrw684z67ErmtjqRmFYtV1lsKEy34i/BAOpK7j0DZpVGOAu8A7qax+pfEEGsTn5RAMq8
         IlPDjTBb5ILluyMDJoht0hgRv6brqQPKNJjEjOYVR5Q835SH8CBTjs5oknNxpkIIc4PI
         w9IPDCjxuu87CDfPfYGGwI6tdgmoW08WY0+QwwvDV8H/bcug8lSRk/YPY6mAbjf6UI3q
         oN2LVTQglRggyGxaN5vmfwvEh0skfVZkDbEFH7hz2kkFkPyFiORmOYehmDwBngqyKv4O
         Rg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=jBd/k2Sq+O68/8EkFdD7ipz1iFg0ses9aQLVlkeNKU8=;
        b=MHlwP/S+QRG7GIyMy6Pxz8sCMsGo0Kbtsg+oiT41mA7uq0345tZrTh8xxRWTvxbsTP
         04DSN4ab3fQy4dbWSaeuyiaOHIUbmICmRPZpdjht6FPklmrf+3UoWBkhKLqQkEL3H8b4
         xQezdwC/f4L35KoNplaixwBjeL7P6Cl2/AtidIswlTMpykpO/V7wRAItVHpY8kMi/E+8
         5Dpu2CDJIp6m+35sESvUm+6+xvSM6D580TIJO3SkxCMSJ5VQbWwpzX79Oca4we3BGadl
         lQnWCJSEb+Wxq9xT9i8ZUsfv28UQLibl9fba3yrBBHCDr0gGBb0WuUHMUHcGVpMB971n
         xdWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2A675oTUUOAeVsa10g/vACYvjlg9jx2uBVYUiBRq1nkd9ejubo
	6Dquaxrv8Z3TSL1oW7+wR84=
X-Google-Smtp-Source: ADFU+vsz6ygOz7Z1EUKK8ZVtm72t9PI5Z+DJ//nqeywrJG61MTFwzM0gTodHSj9jdmBdAv9bpQz5XA==
X-Received: by 2002:a05:600c:280b:: with SMTP id m11mr2614256wmb.93.1583852900810;
        Tue, 10 Mar 2020 08:08:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4441:: with SMTP id x1ls8026006wrr.4.gmail; Tue, 10 Mar
 2020 08:08:20 -0700 (PDT)
X-Received: by 2002:adf:ef0f:: with SMTP id e15mr1885322wro.213.1583852900040;
        Tue, 10 Mar 2020 08:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852900; cv=none;
        d=google.com; s=arc-20160816;
        b=wYXeG1oWyeIrjC+Eoj+FXqB3gEN+R1AqKkseP3aI5IXeTX+8WQDG2Zq2lm8R3vZzEs
         xwvIKfWSCy6isahvI4Jc6zDugfttcM6exMG0TlCqcnyQA3PgqBIhtMALFF0NlA9RMecb
         ORIwFPTicJep4DZuShn+UfKJ2zA1msL3BMtLNOkVf10b8bG//cHh4zYM2HumyseQM98O
         A5DG/7i3u5pkjv2qzPKQKliKwAEYmYqiY2ASqwU0jaraHqj12fSm8iAkpUGNcggYMHc5
         Lit5tOEeF374seBAR8DoVhzO7dZCX36DGKj9/3YA4FYu7P6pN1qyDz9niyaXaH1h7/8d
         y1sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=I1J1W4CiC3XuEhdlwKRb3dLxWsw2vd5/x5C/MVL7tNg=;
        b=PZyAMC8tw1LdLyeda/Fv0vUwG6n2vHQetV9xhraAoG+fSNypy3PKK1QtKeybvz1Hpn
         o8aBcSPFD8E1QNY3hvuWbNK0IyKO51RvLMoY2zeHeiljiF5X8rD7S9Ti6rbZPHDm5MOs
         4NjqHqDcVEr1obGef5bYQ9kHRAC3V49Rr5PjgFtKgLeDiaQXD4aTg1tupMm0ywGhu31c
         FP1FSL3BTvBkzMbL5MHprtA65UAEwLzsrNqzQVTM4AxmeCbpYx+CQ0VJS13tK8n9txG1
         2eNowtwxQAOurUwu0PxPVYKqmvBNhdgaqSIsVabhD+/NvfX4o+LXRiuvZ++HiOFA+aDj
         Quig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id i19si190519wml.0.2020.03.10.08.08.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 08:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AF8J06014187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2020 16:08:19 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AF8JWp019606;
	Tue, 10 Mar 2020 16:08:19 +0100
Subject: Re: virtio-ivshmem-*: only works on the 2nd try
To: Philipp Rosenberger <p.rosenberger@linutronix.de>,
        jailhouse-dev <jailhouse-dev@googlegroups.com>
References: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8823c273-a3b9-4719-caa9-6791dd6a01a7@siemens.com>
Date: Tue, 10 Mar 2020 16:08:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0203ac1b-87f4-177c-1fcd-c6e10d3d5dfd@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 10.03.20 15:41, Philipp Rosenberger wrote:
> Hi,
> 
> I have managed to get virtio-ivshmem console and block running. But I
> observed a strange behavior. I do the following:
> 
> 1. Boot up the board.
> 2. Enable the rootcell.
> 3. echo "110a 4106 110a 4106 ffc002 ffffff" > \
>    /sys/bus/pci/drivers/uio_ivshmem/new_id
> 4. virtio-ivshmem-block /dev/uio0 /path/to/disk.image
> 5. boot linux-inmate
> 6. virtio-ivshmem 0000:00:0f.0: backend not ready
> 7. kernel panic
> 
> If I redo the sets 4 and 5 the inmates starts as expected and I can
> access the disk.image via /dev/vda.
> 
> I found, the the virtio-ivshmem-block tool waits for an interrupt if
> 'state[peer_id] != VIRTIO_STATE_RESET'. But there is no interrupt.

The state memory should be zeroed, provided the peer is not running. You 
will only get an interrupt during the peer setup when it switches it 
state from (expected) RESET to READY. Maybe we miss some proper 
initialization of the shared state memory in Jailhouse.

Can you confirm that the state memory is in a random state on first 
startup? And that it changes as expected for the peer to READY once the 
non-root Linux boots?

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8823c273-a3b9-4719-caa9-6791dd6a01a7%40siemens.com.
