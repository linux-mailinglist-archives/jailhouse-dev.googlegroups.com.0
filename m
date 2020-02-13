Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVVVSXZAKGQECTEVE6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C015C031
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 15:19:03 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id y15sf2174245lji.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Feb 2020 06:19:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581603542; cv=pass;
        d=google.com; s=arc-20160816;
        b=AIZnANyed8zfYyugF/L38kWAiHVlZO2Y6FReTBdxnfPb8Y/89JS/SjLQKP1bpkWAv4
         Gp8TtDJ1QHkL6B7aNq2K4J/6O53rCONTV2PfQ66li1QpnrYZrNqV9nZzHgvEwE+xZ230
         9vLZhAksqquAtU8mp+0gBGcT3ehN8w8NQMi2rkB8iSlo/1hFzXETZhWw0jEf5zY5+rH6
         3maI9j0bM9VjA/CW1TtsRDRekPxczmdHWYV+m3lDSXH79dtDMwL1rCMUceTTOMiUvrl/
         SAbb9BoijkX9ypeeG8vaPA4nsu+DxQgSoEEhujyQHakNBrG7ywd8etzjkijuqqviqE01
         02ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=QPUYboGkcS48dozC2AM1WadxGqgwCmHRIWdCQ2bz/VM=;
        b=wdqTP9YMB2bVPIvxO/p6kqGJokH5ZN3fZtFC6EWOBuaqK0gMwr+cQHZzAwuFG4edrF
         +BaKsaEQATn0xflA1ctyCPuZq4r7t2LfJOVOPVm5uBR/bK+C8lGDiZ2NhOlZKXZbIxu6
         M3aNFpVJUfMNkpBIxq5POKNlVO9hGmt9rocH4BGs/+IhSQLQAxNvcwFAYdgzL9xqQu1N
         xJ/S7GrB+THR70cKXD8LOtotUWOR/TajiZEXN4MwqykYXKqKkjrMRZ0J8tIHPInpbJMv
         5RT46YEk9TqLf/0kVIWJqtVi53FGDkdRdkw+qej4QpjaN7HHFFP8Ggq4+P8OcPkdMXCY
         oIlw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QPUYboGkcS48dozC2AM1WadxGqgwCmHRIWdCQ2bz/VM=;
        b=WhG2iIWi1dW1asx4Vw9OgN1XEFoKl9pfsltwq98U/flQMClgf+hgJnZL9iGal+xlna
         2bwZIf8jg6HanahZe8EAHWF1g2Fb7tZNmQd0N1bFk1QJtnIQGuKXTpPIUf8RtoucqRTq
         tSf3RoAHHAGpO+XteRqrffjI0Ns3yCXSFrReQvpVGQhy2SkIRjL5fhgPWz7xmJsg7FO8
         9rhFJqeWv5EnWLKAOLzli51fLxibFyB0r9WaNdNMyg+jdQiZfdmGW5zEhtZ4NyJFJevr
         HGevY8elAiq06fFQrvqLvuI98jx3n2XNarRoCL/JstF11uOX126+s0PH84N3D91ORD3U
         jNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=QPUYboGkcS48dozC2AM1WadxGqgwCmHRIWdCQ2bz/VM=;
        b=YoYDEVaIpqMSuYLBxu8rXw+U9qVHuFsHHuJ+/qCv4v8UN/2lR1PQCCenvyugAvQxaL
         zjowFQehPw5sB08WEPsL87Skz5b3dWyVKmydBaSpk7juIF6r2mM1+VzDhBG0kJEfmXNN
         uIGhK0C1SYu88hwAHGZTwXDux4pPInBCo4qc5ms5rFCJznFeIl+tEF1xEddo+JiPkcVX
         GCrRLU1Zt5zXz+nrkSS9gjBIDO77FrQeVQOz/3xRQdr1MWDak0m5hmpBGkbrNfdhNH50
         eFrekttypvrrXbjJDCaRq8VImuURkeUbgMTmRGuBVnM33qDHIWTwfJetaeMLhDgnPZ1x
         1Mjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVbHsVjk4ZLsd+VrBTNhqp0GP7Rr+Ixg40CrDG8cALOVe+xcCFf
	VRGQG2tM70iZoPkdmViBrSY=
X-Google-Smtp-Source: APXvYqyeN9YUdovIQcbAdIkL2iG+kw7hWo4+J/4OgZ6S4nz5QkBenWjaopU2VP63+lU2lhBCSPHdZA==
X-Received: by 2002:a2e:884c:: with SMTP id z12mr11484912ljj.55.1581603542615;
        Thu, 13 Feb 2020 06:19:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:3f0b:: with SMTP id m11ls2711291lfa.0.gmail; Thu, 13 Feb
 2020 06:19:01 -0800 (PST)
X-Received: by 2002:a19:48c5:: with SMTP id v188mr9747724lfa.100.1581603541648;
        Thu, 13 Feb 2020 06:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581603541; cv=none;
        d=google.com; s=arc-20160816;
        b=DIOICv19fqaKR/qd5Yzde8kY/+OQRi2pGBJMrArVF2a/B3myfb/a7D+ps5VrYSpfIT
         /4/8OuEelhBGBb02pwpRJvZ1ecPMxl5Msus2jYtxjbOrOPlzDBqkl9mVF8IllTOAG1Wt
         DvX9cqnE3yE7AWMCIc8JjrB0JUB6YAb5ivWC4znnkQ+5QfBoq+zXbOa4mckXHf+ikxt9
         Z5j0mDhwHTX2Aku0F9klXgkrRwZinwH4uftI4gns7iKZAKlC2iHHc96d0rugD7VkXLxc
         Doh/ImFMhUzVwlB8Ga4ptsRo/UZnibMghPwSivx6uj5qqEK/ptqzZOl2TYHDeUzo2a9B
         NKDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=+GZ4u1k3DkJ1n2DLoiUT4nMHjSJhlo+jiBnbhPaoDh0=;
        b=bn2kfNEKR4kdtDWMZdd05pbckNPvDVsInHQG4A+vegioRKF/qyikNMmpz0x94EWhKD
         4gT4O1U8zV9GeAHtd/h7lSKY2yh9HN031VgWiuTIFv8aEL9EQ4RVrC7W17C8REWhWPAx
         WXa6tkUL6Glhh0vdueOJQ8ALLwJHmBYbnsIQcFwoQkBP/t8m6q53UsGUSCT39RQ8Jye/
         vk5a/WmjmOs31FK7u27Menp/UhzmtC5GStJSTTRp6vnYaGYmWjAVFkwi4alVL4K714oj
         0wR1sxmZwtURwfZyh1Tfm0iMrCge127hSA0WOgXJaKEP76s6gtx9jFcaPwiuAAO5jjxY
         4WMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a11si129623lff.0.2020.02.13.06.19.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Feb 2020 06:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 01DEJ0xj025447
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2020 15:19:00 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01DEJ0tl001562;
	Thu, 13 Feb 2020 15:19:00 +0100
Subject: Re: [PATCH 4/4] Enable pine64-plus support
To: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>,
        jailhouse-dev@googlegroups.com
References: <20200213134430.3052-1-vijaikumar.kanagarajan@gmail.com>
 <20200213134430.3052-4-vijaikumar.kanagarajan@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <53bb9717-30a9-c930-8dcf-a6e0fcb2d99e@siemens.com>
Date: Thu, 13 Feb 2020 15:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200213134430.3052-4-vijaikumar.kanagarajan@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 13.02.20 14:44, Vijai Kumar K wrote:
> - Add the necessary machine, multiconfig and wks file.
> - Add entry in images list.
> 
> Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> ---
>   conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++
>   .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++
>   images.list                                   |  1 +
>   wic/pine64-plus.wks                           | 16 ++++++++++++++++
>   4 files changed, 50 insertions(+)
>   create mode 100644 conf/machine/pine64-plus.conf
>   create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf
>   create mode 100644 wic/pine64-plus.wks
> 
> diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.conf
> new file mode 100644
> index 0000000..0949ab4
> --- /dev/null
> +++ b/conf/machine/pine64-plus.conf
> @@ -0,0 +1,19 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +DISTRO_ARCH = "arm64"
> +
> +IMAGE_TYPE = "wic-img"
> +IMAGER_INSTALL += "u-boot-pine64-plus"
> +IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
> +PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
> +
> +IMAGE_INSTALL += "u-boot-script"
> diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> new file mode 100644
> index 0000000..5e66c94
> --- /dev/null
> +++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
> @@ -0,0 +1,14 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +#
> +MACHINE = "pine64-plus"
> +
> +DISTRO = "jailhouse-demo"
> diff --git a/images.list b/images.list
> index 26a802d..b794d85 100644
> --- a/images.list
> +++ b/images.list
> @@ -7,3 +7,4 @@ macchiatobin	Marvell MACCHIATObin
>   hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
>   ultra96		Avnet Ultra96
>   rpi4		Raspberry Pi 4 (1 GB edition)
> +pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
> diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
> new file mode 100644
> index 0000000..aacca04
> --- /dev/null
> +++ b/wic/pine64-plus.wks
> @@ -0,0 +1,16 @@
> +#
> +# Jailhouse, a Linux-based partitioning hypervisor
> +#
> +# Copyright (c) Vijai Kumar K, 2020
> +#
> +# Authors:
> +#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
> +
> +part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
> +
> +bootloader --append "rootwait mem=1792M"
> 

Could you add a section to the README as well?

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/53bb9717-30a9-c930-8dcf-a6e0fcb2d99e%40siemens.com.
