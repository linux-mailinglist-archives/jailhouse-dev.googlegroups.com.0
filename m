Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL4WT3UAKGQES2O6CKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 063D5482D2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:44:32 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b14sf4613201wrn.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:44:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560775471; cv=pass;
        d=google.com; s=arc-20160816;
        b=R7IjYcq1/5gpATWwATt7MyY7Sazu24kPZmbyRGxlK+skkEwQPkJS7FE/51utGa5w+1
         Rs8nV2Bk/qDvHPsmubRikt+0DgSNpdApnEoZz9iIjR1rUO2/jyUs1d3TRg1id1JVDmso
         d7z7dMd2VKGy3oYSD4PjFHQOyRmn+LoXGkEe0HA5xwbYpbcTL3eayxo4oPILGsPQZhRg
         RCVIKvM1c3J4ElHHy7DXF8layPQoT1IO0qnq9rm0DzHgzNkd92ADJ4cOM8vaS+apC7uo
         hLpAoF2uWfAI0nLjK5/t4tmErTxfiQxlbNaSO9mkB03apirDECsDa/gcGSATPfE0h22C
         RVcw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=3fjqQlhAl2AjzLpXA7vDITgYMK5ojp5FbCA1w/MLHbI=;
        b=Ul+APQX4HwAP4L59YiLST+ya60F9r1esEGScWYvE4Te2ebNSZH+nPx6R+3x5Sf5iB0
         G3aGR6Bf+kjtiyonObOn4A65uN8BMqpkj/dBjMzyphlSnZjy6L4mXBNihrq/LynuDxKI
         WwfzSG+wz+E+4VnIhbrkut00qsCyPgpB3H0M+ZTOgXmmRWLbrUGE9l5UJY+HkjiUny21
         CmI+mfHym7kxbJh4jJl+zH7dP3T1kg1pLkKQjBRKIB3z+6olAd0gpyy90BAEsk5zt3Cx
         fBHJtMhyi2qAekh+ddc2q4s15l+WvPhTRMlMDnF61eqDIR8VX3JgFgV7PwbOMzEB6WHv
         RG5A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=3fjqQlhAl2AjzLpXA7vDITgYMK5ojp5FbCA1w/MLHbI=;
        b=pkUGdbtEh54mzEHbQEERTvrYneHVMoDZbLBmg4lh/LDHJF1nGPvCn/qAGhIV+RAd1I
         CGfPO5j9PSsbR/v9BNWHWBBBH52n2vFHhpPiZX+LlvTx8B4bWR2btsskL63TeNW8L6Rp
         SJRXT5yvdAhuyks8Tyx3lZSZVyl1g3IdAORXD9xZxiD3iEDI3IU4L4ueGpU54jesk3D9
         g+Ka0Ham8Or8OMtCyfaFccH/Msa5zfGbIzG2P/gmpB8My2UUsiXs7Ve4qdW5463UsO7l
         mawNuh0EYzhgZtrBe6z8q6+yY34+IUa3OC4xL25xqwp+dbQ4Js35UlaKsBJKCnx9xZZB
         /3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3fjqQlhAl2AjzLpXA7vDITgYMK5ojp5FbCA1w/MLHbI=;
        b=QwWaybAOhLKyfZxSIz3TcadBdx0YtkgrR56A9V/UFPRMk115AkhjTKKuzk9Na6Ugy4
         BqfOtRj0hhnUd/he0H9igY+cYq1qhkFUbfRgFb9dYvWG8KOg8oZOgQlFuC+y8h06MDfc
         Fr22puxXUlgpJZn1KHVJkMCC46Y/RhzQR7lwQIJHH4bDdJrfpGHBnsnDwFCjAtEOYo57
         NPIMilLHHgd99lsjNA/J7wccJBVtmNzJp/JjlUAKMj+OIPHwy2xt9mJQrkfMqWrGUnmA
         7uHhWCDg3x/In2/vEldMCNwPHTbEW5qmLEcq2HhAkM+EjuHEBGwHEaEdHrGaTxCHy1Y4
         rlag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrrzSAht/zx6f7dKTdM1afxGKq4w1fndxn7aUOxwm0Lc9mAsKi
	yjQJ+cbRp+LsPvfNPBsIDvE=
X-Google-Smtp-Source: APXvYqz93/I59BaUKfbE37tMrQMq96JdwUG15NuVEAYFOpDVPeH/1reYh7pOgw0XeBg+BFw4NrU30A==
X-Received: by 2002:a5d:4489:: with SMTP id j9mr31934067wrq.15.1560775471725;
        Mon, 17 Jun 2019 05:44:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b484:: with SMTP id d126ls4906707wmf.2.canary-gmail;
 Mon, 17 Jun 2019 05:44:31 -0700 (PDT)
X-Received: by 2002:a1c:dc07:: with SMTP id t7mr19814968wmg.164.1560775471074;
        Mon, 17 Jun 2019 05:44:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560775471; cv=none;
        d=google.com; s=arc-20160816;
        b=bm/ljjdXcez1Qc5bZZXjM4B1Pe5UP4rOnZ8r/UeVJXSuk1im+hl4n5PYLIACT9MgOM
         AdhYF+KkABa8ZAfkQTwr2l52ycvQUX78klHX30FO9aCGrS1MggEkY4KCBkVhgsbzOMjs
         REVt6zyo1kpyN6Ju9Q4ADXLsdAe7tn6oT3AL2jWpoIxB/26z6yF1ptg2FNJ8MYATvl7J
         hpmn7hpsolRsqZiXn+J4Y1D80wCO8pFS6HwFTbpqxlv2r+7NmhmWNzo5910xxHkwk8nz
         Omsh/fJ0BVInGDPjgxFFAatGLVPf4rrhfIkUM/Zgl4nWEmEqt2o9SG2+FF991uQ9yUJg
         ciKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=24aV38ab2QmqcE/kg2fCcFeU0N7iwhzRcb9SuGWsHxE=;
        b=DyWfmeoS6EM/AhVxoTeWJitQcCWBzfg+C9/CYgLR3ZsfYTXuTvB1tI+HEbbEyhzkHe
         hWZQ7WakQJr3F/G8Ce8ZXiBj6+xgI8cqCy761pt6Iz1H51zB6SmRdlIHrmXPEZn3vM3f
         5fXgux2I9ImTyEtXB+CM8SP9/fYtDSvBVnIENn+jCoM0kfLn72e2rXG5KRKP6YIe7CfE
         QdGnssoBjol6QrIuEXsc1bBZCsLksGTbfqag98PoKlJ4nbnHvfzn6pjvvv7hrEZvvOwU
         f9iFFyL2WLt6blU8ixLXXYIs2b1jM2kzzO3ZcbemcghOGWe3+xsmTqFo2FvrX4Ca4N6n
         eUOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v3si198022wrg.3.2019.06.17.05.44.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5HCiUaH004666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 14:44:30 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HCiTVo029943;
	Mon, 17 Jun 2019 14:44:30 +0200
Subject: Re: [PATCH v2] x86: amd: fix comment in MSR bitmap
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20190617123745.15409-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <cda1df93-9d15-a1ea-2627-2bb5c112bb74@siemens.com>
Date: Mon, 17 Jun 2019 14:44:29 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190617123745.15409-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 17.06.19 14:37, Ralf Ramsauer wrote:
> So far, the MSR bitmap intercepted writes to 0x803 (APIC_REG_LVR). But
> we need to intercept reads. We don't have a real x2apic, so we need to
> forward reads to the apic.
> 
> Interestingly, APIC_REG_LVR reads via MSR never happened so far:
> Root-Cell Linux won't use x2apic's MSR-based access, as, of course, it
> doesn't see a x2apic in case of an AMD.
> 
> On the other hand, we emulate and use x2apic for non-root inmates. But
> our inmate library won't issue REG_LVR.
> 
> The correctness of the comments of rest of the list was checked with a
> short helper tool.
> 
> There's also a read-intercepted area that can be zipped.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   hypervisor/arch/x86/svm.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
> index 9c3e971b..f2db518d 100644
> --- a/hypervisor/arch/x86/svm.c
> +++ b/hypervisor/arch/x86/svm.c
> @@ -64,16 +64,11 @@ static u8 __attribute__((aligned(PAGE_SIZE))) msrpm[][0x2000/4] = {
>   		[  0x2fc/4 ...  0x2ff/4 ] = 0x80, /* 0x2ff (w) */
>   		[  0x300/4 ...  0x7ff/4 ] = 0,
>   		/* x2APIC MSRs - emulated if not present */
> -		[  0x800/4 ...  0x803/4 ] = 0x90, /* 0x802 (r), 0x803 (r) */
> +		[  0x800/4 ...  0x803/4 ] = 0x50, /* 0x802-0x803 (r) */
>   		[  0x804/4 ...  0x807/4 ] = 0,
>   		[  0x808/4 ...  0x80b/4 ] = 0x93, /* 0x808 (rw), 0x80a (r), 0x80b (w) */
>   		[  0x80c/4 ...  0x80f/4 ] = 0xc8, /* 0x80d (w), 0x80f (rw) */
> -		[  0x810/4 ...  0x813/4 ] = 0x55, /* 0x810 - 0x813 (r) */
> -		[  0x814/4 ...  0x817/4 ] = 0x55, /* 0x814 - 0x817 (r) */
> -		[  0x818/4 ...  0x81b/4 ] = 0x55, /* 0x818 - 0x81b (r) */
> -		[  0x81c/4 ...  0x81f/4 ] = 0x55, /* 0x81c - 0x81f (r) */
> -		[  0x820/4 ...  0x823/4 ] = 0x55, /* 0x820 - 0x823 (r) */
> -		[  0x824/4 ...  0x827/4 ] = 0x55, /* 0x823 - 0x827 (r) */
> +		[  0x810/4 ...  0x827/4 ] = 0x55, /* 0x810 - 0x827 (r) */
>   		[  0x828/4 ...  0x82b/4 ] = 0x03, /* 0x828 (rw) */
>   		[  0x82c/4 ...  0x82f/4 ] = 0xc0, /* 0x82f (rw) */
>   		[  0x830/4 ...  0x833/4 ] = 0xf3, /* 0x830 (rw), 0x832 (rw), 0x833 (rw) */
> 

Thanks, applied.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cda1df93-9d15-a1ea-2627-2bb5c112bb74%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
