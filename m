Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBH7HSHUQKGQESBLOGKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BA634A7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 12:59:44 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id o13sf13181478edt.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 03:59:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562669984; cv=pass;
        d=google.com; s=arc-20160816;
        b=wsj2lSFvWsxU3uiFBra8HV/E1QLafLNTmNyPo1dGUgxuME+5xnOJsPU+QGhTixwGMW
         1PKmiISWYwy3L3ztDSv2+LFui+q6cunEe8HrbqcqvLUKRyD7MouRNyTStbtnZaixWjDn
         i6J28Q5dKijDm/bso3jQKt6nVLIkUhNmZnuzlNrliQi6eI0I/HLen+t+BQEO4nKDiJEI
         0T5woPwe8nEdI6j7M+RtlRSGv/h5zdFIbcFE+yBTAQwcsIoue6N6oUsya9barFs/GZkz
         1YP6yvYxpBMRcPxGVvATQMhZmYQC6TaNEknSy3E6cgRlPQrwl+QA+uAPkMWXZeI4MasT
         SVXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=hKr8HJ4CaYwoSC8T9xE5hrT/JVlJ/1Pwq/D0Qotc6b0=;
        b=v1McGVUFnqs6suLvI+3Hu4IzFJesy9YuYfcUCjTFTk0PZ99hpNCrVBhJxPjLCHyPiP
         xBz692cqOD20s2/zmdBjCxLVu0fSYEwaVnCHWOEuIeBhDkmGV7Zn0IZCPknougLnW9dt
         86qMieB3hyCV1hkFN4XKlxFJEzb52qQt9PY0G7yczKCARvQzb9b//3YYy/ocLEpMQjXo
         tfUaqnzoaBobGPCacFjv183e9ki7NJQ9/Z1FCeSfbomCnAqcvu9JootKPj7RJ4QpLLlC
         1QExKPf0SepM2+BUyAtUgbXpLdZJiefvINI6zFJazRhV7DJRXLsNAsz9oR5tdj4WCvDd
         3Y0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hKr8HJ4CaYwoSC8T9xE5hrT/JVlJ/1Pwq/D0Qotc6b0=;
        b=hgweujnHCWDVWL+k4ntlxdzMddgu/EM7JtfI/BRfjjZtnH4qEgE/vHjzOIL1RXNyd5
         XyECb0xrm19S0Qcl7UI6s5co+oysLdGzZalpCDcLnjnhZ9cP+G/VKhqFYsUOaborj1Ld
         4ctJ04T49KKMVo9EkEmmSZlV0VUa+weHih3Vc5JxUzCsGFoO4B1t8zFa3dLsh+C6kBC0
         n3R47r+RKDESvBl0rSgxVu3DVPOsQqUokNoSsJCjRxHBFBB3hvkCQNF4LMlCeOBgaQiX
         JpesCbaORXTRhy0imdXDO4gSI4LmYLk1dAiLu5fl5EyIkJrYiBT/om0RdlJloVWcp9OI
         wWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hKr8HJ4CaYwoSC8T9xE5hrT/JVlJ/1Pwq/D0Qotc6b0=;
        b=sA3jFO3LeZ2CVb9LIEuDGKq6llUTwfqZLYFYm/oz86TnmOuYLhBZR0B4zVHKYDv0Je
         6KAIlqpir9X+MlJM0gSVPnnMxtvuwBU3SvjKDgRPW5ldn+KLAfOEWpZcr75j+QZZ6e21
         MJ1c5dJGItz/MjNUXblI9wYQ7KtwETIauX0+/gnv/oddJEPy+FVHa4R5nV2ktJkIIdg/
         yhWRZtpnBYW2rkNISgfJHuxyCcRoiG1yuzyHNRqeen7Uuv9jGvS5B+Q8RwHtRrSV+vVD
         HCTrGY64j4CSV49sTSOdR76LTfGpIlv9+jueeueqJKzU21C5wNgRXVbLNZRDuQTpy6XL
         VZUg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVAiKmSgs6zih/cieMTv8aoJjL6ZS2hf8CWaAD5nOhPp8y11+0a
	UrxcKrDbpBNSxF/uRXsE5Zc=
X-Google-Smtp-Source: APXvYqxrZbNWx4A7NPFhV0lpNFCUK1UYVWqEWf1V/mqu5N4LEmLfp3IfBiGswHG8S/HpOifrCjVv4w==
X-Received: by 2002:a17:906:6c7:: with SMTP id v7mr20583192ejb.19.1562669984024;
        Tue, 09 Jul 2019 03:59:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7a3:: with SMTP id h32ls5492272ede.16.gmail; Tue, 09
 Jul 2019 03:59:43 -0700 (PDT)
X-Received: by 2002:a50:c35b:: with SMTP id q27mr19166374edb.98.1562669983368;
        Tue, 09 Jul 2019 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562669983; cv=none;
        d=google.com; s=arc-20160816;
        b=z8Q8wyjR56oMoQ1KEZgonDGiDwqJmgUOgH/BcDjH+frW/svoyg8Z7Euuk7jc49mu4/
         rc2LIbem3hpelO9W4HDcy4VKwN9ZkXqbALGfkTahmuQAI4+1x7qDcnqJOq5V9I5k9zjW
         2dfBxfsyDYocY8s3jv/tXxEvJkt+f8EbPqUGBqdFphsPqS9Sp3CyVpmhoZyrnYlFgR5i
         E4W55L+xz58dnTPeWGViX2ng4Klybu8fCW25irJJz432IGYnWN/oMrp6kHD1lXkeGQEp
         P24KA7zwEaEHzaeWW6NWcMFPRqbFLStsvCPkCVyGacMFdcd5Dzd4VQeloNUkWMFJrDSO
         2GmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=1oxn5aXOxp9ppDg52uaBKunrbF7knOqGtWn1bfwxmNE=;
        b=WTahC5RwFvLe0MoNKjTIvoQ6eDjOV3RBZvEwQGJ20lpjJLMLV6Qk54qfR0BUVAVQ5c
         i4qw+IgLIWk0bPghJNrTHRL62i947NKhqoqBgmSuv2WFeay2ltIlT7f9MFXE8nZjN79L
         eeukqD3WuPTU97W+GfIPv0H7/uNheE0lYTN7FTpVfyWB1LkuL/2okysxTENqVc/ii6k+
         sr0HWBwrXe1qNnVPAv1jBl+XQqUO7jQKhliQmewzGHEMfUKeR0CBD12cMvU9bxNuXhOn
         16LrFUDZot8sy7TcFpJyg2ZJIWxDJgRbTBbQjvalpz8y4VWKlX/ajg4fa9gDAJRFMmMV
         Rx8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id 91si661830edq.3.2019.07.09.03.59.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 03:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x69AxgKu019166
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jul 2019 12:59:43 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x69Axg1x022602;
	Tue, 9 Jul 2019 12:59:42 +0200
Subject: Re: ivshmem 2.0: Reworked ivshmem rework available
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <8d0a6e80-d926-8783-949d-8fd036611492@siemens.com>
 <c89ecf4a-6287-34ac-b421-457c084d654a@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5fda803a-d8d3-379a-66fd-a22bb46fb778@siemens.com>
Date: Tue, 9 Jul 2019 12:59:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <c89ecf4a-6287-34ac-b421-457c084d654a@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 09.07.19 12:11, Ralf Ramsauer wrote:
> Hi Jan,
> 
> On 7/9/19 7:36 AM, Jan Kiszka wrote:
>> Hi all,
>>
>> long-announced, I feel like it's finally in a good shape to publish it: The new
>> version of something I would call "ivshmem 2.0" is now available in
>> wip/ivshmem2. Highlights of this:
> 
> Cool, thanks! Will try it.
> 
>>
>>  - vmexit-free peer state table in shared memory
>>  - all key features of current QEMU's ivshmem, specifically
>>    - multi-peer support
>>    - multi-vector support
>>  - unidirectional shared memory (optional)
>>  - UIO-friendly one-shot interrupt mode (optional)
> 
> I saw there's now a FEATURES register. Should we maybe also introduce a
> version/revision register for more invasive changes that go beyong
> adding a feature? Or will handling of different versions be done via
> vendor/device-ID (as I suggest that's the case at the moment).
> 

As this is a PCI(-only) device, we do have that already: The revision ID in the
PCI config space. It's specified to be "2" for now.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5fda803a-d8d3-379a-66fd-a22bb46fb778%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
