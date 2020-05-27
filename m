Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBAOWXH3AKGQEGGIO73A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3d.google.com (mail-vk1-xa3d.google.com [IPv6:2607:f8b0:4864:20::a3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 735EF1E4399
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:28:34 +0200 (CEST)
Received: by mail-vk1-xa3d.google.com with SMTP id s206sf9125752vke.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:28:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590586113; cv=pass;
        d=google.com; s=arc-20160816;
        b=IJgteoskwQqTG7VMhIOAqZ7+/vlNDJ5QRDCe1tlzHC5ztljFirG+/PTmgskbNa3qv2
         kGGJargBvobg0CjEtkwSsjMBHxK17H4dt1jKsOhBQKnO1Xk2ikoC1X/hJlzKJQmVVESN
         8tILPy1/wDNoGONP7p+WVvSrvC0NttrASOuKf7cqFsrnY3iNbsPW6woDP96WQ/1LITHl
         Kh9/0RPz2/X5CKesQDX1YVClCmPMRVd7ZFzjBcu1bqUAVwUu2oCw3mkmt1D6Jo943MH+
         GR1863ZqgmnhOlXRDACD7gELH8yo9giVr7LAWt0GVf7GvvKuPyzmTJ2Chpr3a0CIGEke
         Hc6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=Qtybo0w2trS5PwSCI3WXJnN1r168Mr9C0TKJ4Rqqndg=;
        b=ZlMDJtITrVY3+ZMIZdakjJZ4E2VxJsbRjfkZ4mNatIJZNETGYxlRtdqDNs/U117K38
         agtqgmmSrvTXVr9oxaYLvjmHcDRFukxSWvOchjyy7upMjLEs/kpxJZxUxX3aCq6hxc1c
         iO2ZJZvppgj1Zmvn6SFPTPRV+xr5YVfIMawaC9PkiW002F6P2dmTETP2b2L62RM39ArK
         PYuha7N6dUy2WGeQVsRC/BtpzUbs7uDku7Yqo6AYUyp1AdmCYUKQftaztoxRQAHXiQZ+
         Ipu2N6SHVcIA+NpbFVmx3cW5b68dEBGTWgN6ckzTpGd3Tse8OA83U9yxkSbPcLD1n82P
         ViSg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=luCmgPB2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Qtybo0w2trS5PwSCI3WXJnN1r168Mr9C0TKJ4Rqqndg=;
        b=nKxdS5ibjwhOUCl0C/ehNYYQtUTuHMjARpItBKodJXeepnnDpY7sbm4gJkj+oNIc2J
         l/tRySn8WX2DSH4m5P5ChfQKDdjAT85WULHVKar25dGOc6wXp6BzD74NyEZsE/dfTAv0
         4vy+7WSrkP4rXGFKLGaC76sHopazXtxzqTacX0OSEmqUfxtyQs3mny/0mIWFLhfivchk
         FYa6QPpsL2SEETTjLt1V8Zn9otAo1QAknZoxuaFfSooCeVkbLO+zFgpwshoRtSQM4x7S
         kZG0t1MbGWGEsFwUSlbm4trXnjsgcEsUFOkDUFZtU7PjTSohUpWYv13Cf9iTdM1gLoKa
         qF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Qtybo0w2trS5PwSCI3WXJnN1r168Mr9C0TKJ4Rqqndg=;
        b=ok+Ch8j1rK2/m0xe4fOOslI2Zp156fChrgeGmaVzZBzp29Um7oqqQjMyCZdpqCReWq
         Pe/zQtmA8rpTAms7MpRdJnBv82fw8Hunrn9cs/TwlIh0cwdK6ixYKtRj3xty0jMoub8+
         dATp7BpEqFK0iwVId4Ns9AakuL696X9wF5ZOl06rrCnbg688OJcRR522ogfWPCUZE6rv
         /evUX01lGYqXlKpLPzHsY39fLI4SiOOT5jL3wPWaJikeeR3PicpsWxb1tlNQwNMozqKp
         xhYai24eeCiM72PMoiMgKMLNQYyYqE+ui2BhvWWuCcJ7oriSesFbwGlto7RDgTk57hyt
         lShA==
X-Gm-Message-State: AOAM531/TG5JxH9YlukF4oifNcWsoUYlopGBM15CRuz4YZrnTtHniDZo
	6HASvfu6t4g+qWMNpCrNdHY=
X-Google-Smtp-Source: ABdhPJxfP0erZfGD3NXmgqKb+qmgqF//cw7dujyxLOO7ybkFaQmzlCfJt7DjjzC/ZTgo2co/MkBi6Q==
X-Received: by 2002:a67:ac45:: with SMTP id n5mr4676569vsh.108.1590586113481;
        Wed, 27 May 2020 06:28:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6102:418:: with SMTP id d24ls1540722vsq.7.gmail; Wed, 27
 May 2020 06:28:33 -0700 (PDT)
X-Received: by 2002:a67:2c4c:: with SMTP id s73mr4129477vss.124.1590586113001;
        Wed, 27 May 2020 06:28:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590586112; cv=none;
        d=google.com; s=arc-20160816;
        b=ITSaW7DK9LCuTnrMcH6J8sgmsP16PPm4hZePz1iioJRAlsdy8Sfp4eyk8cgVl0sZ5e
         5rGR1ZN7JXJnNgaL1TOERrACN+UIU98CNXXJKhyBhzaRiyY7sItqEe+Gn2vZIPqLaYlc
         EzggWXc2gUvazgA61cIC7L+bAiJXv7GjsPsVxIo94KcBiFleUS5nYP5wlAknb82UcQ9L
         Mt02ex1wrpe8aBvfWSfUe5eELWzP1MjZU7gUthBepa3/2W9tuBeMgS7vfGCAOQFy5IFf
         2jFH02iwEI43TrbVpI+PeBn6bF9ft9XpeOxTreUbCKlSvWFCvgU96HFJYUFJI+oTXXyQ
         yzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Tly5V7J9yUG1BmcamSWJhJrN915x9/nLK4ajHEMde5g=;
        b=Ou954q0H970lTsePhq8UMpCOgZ1nEdbJa7y8hi8HkumH9uEfRSd2Yf/KfVW2TGIuSc
         yXszcBKMjGIz0c4ADz+dqiguslIv6YuwEelyJhM5s7fdZcHQ9gygVWnz0XZl3h47/aM8
         5xZHdoJ1y5rlbONDxaNxrTpogRTPjvtyYX90CYUEhvT4A4XCNj22Tf4jaAy7qm8nhbux
         hCms9jewQU6QHkYMtOCHisLj5fOdRPN0QBotCwgJvzZvXvlGIlGZg4t8OX1D4vVJKdBV
         oiIsU6/MAQnluptDERNcsnck2gPOkRWcQFGhji/nmpNbjLsoVHZ02iXGCVDlsUZmsh2q
         1t/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=luCmgPB2;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id y7si177506vko.5.2020.05.27.06.28.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:28:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RDSWw7023240;
	Wed, 27 May 2020 08:28:32 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RDSWqg102486
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 08:28:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 08:28:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 08:28:31 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RDSUOQ068724;
	Wed, 27 May 2020 08:28:30 -0500
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
Date: Wed, 27 May 2020 18:58:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=luCmgPB2;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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



On 27/05/20 6:41 pm, Jan Kiszka wrote:
> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> Number of peers available on a platform is different.
>> Do not hard code the target peer_id used for interrupt.
>> Parse this from the command line argument.
>>
>> This de-couples the dependency between number of peers.
>> ivshmem-demo can be run to communicate with desired target
> 
> No command line, please. We can do (<ID> + 1) % <Maximum Peers> as
> target. All that is accessible via the register interface. But then all


I believe, as of now, only root cell can communicate with peer1, peer2, 
etc. Non root cells cannot communicate with each other.
Please correct me if I am wrong.

(id + 1)% max_num_peers     logic won't work for a 3peer scenario where 
root cell app(id=0) wants to communicate with baremetal(id=2)
e.g. qemu-arm64 has these ids.



> demos should be updated, ie. also the bare-metal version.

Sure, can I hard code the baremetal to always communicate with root cell 
(ivshmem id = 0)

> 
> Jan
> 
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   tools/ivshmem-demo.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/ivshmem-demo.c b/tools/ivshmem-demo.c
>> index 163653e1..98d24111 100644
>> --- a/tools/ivshmem-demo.c
>> +++ b/tools/ivshmem-demo.c
>> @@ -91,10 +91,11 @@ int main(int argc, char *argv[])
>>   
>>   	pgsize = getpagesize();
>>   
>> -	if (argc < 2)
>> -		path = strdup("/dev/uio0");
>> -	else
>> -		path = strdup(argv[1]);
>> +	if (argc !=  3)
>> +		error(1, EINVAL, "Usage: ivshmem-demo </dev/uioX> <peer_id>");
>> +	path = strdup(argv[1]);
>> +	target = atoi(argv[2]);
>> +
>>   	fds[0].fd = open(path, O_RDWR);
>>   	if (fds[0].fd < 0)
>>   		error(1, errno, "open(%s)", path);
>> @@ -113,6 +114,8 @@ int main(int argc, char *argv[])
>>   
>>   	id = mmio_read32(&regs->id);
>>   	printf("ID = %d\n", id);
>> +	if (target >= regs->max_peers || target == id)
>> +		error(1, EINVAL, "invalid peer number");
>>   
>>   	offset += pgsize;
>>   	size = uio_read_mem_size(path, 1);
>> @@ -180,7 +183,6 @@ int main(int argc, char *argv[])
>>   				error(1, errno, "read(sigfd)");
>>   
>>   			int_no = has_msix ? (id + 1) : 0;
>> -			target = (id + 1) % 3;
>>   			printf("\nSending interrupt %d to peer %d\n",
>>   			       int_no, target);
>>   			mmio_write32(&regs->doorbell, int_no | (target << 16));
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/eb224001-86c9-593d-b4ab-d0ae168fcbd8%40ti.com.
