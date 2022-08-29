Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBI4QWOMAMGQESE53TJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAA5A4ECF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Aug 2022 16:07:32 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id x13-20020a2e7c0d000000b0026373642980sf840489ljc.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Aug 2022 07:07:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1661782052; cv=pass;
        d=google.com; s=arc-20160816;
        b=nkXGR6rK6kpB7tWZZUQJKG9v7BMpwgvtgOIYx7wDMo3c6bnX3h85YIktvn6Dmm/p/z
         pvusUoy69ZJ1jci1LBHs3mtdBJdrdaeBB6PWnHMtVrj0CPI/a/F1HuK8MUFkyDKOpPFA
         wN1or0f58UNKVd8vrdrtxNJ0Ta75Zn1n3mnHmxONtwT70WE1UAP0I9kCigTaisu9JxC+
         kDmDwSKm9amrxIXroy1jeVsVucD1OrDeEC+QNIFBhtEby19j7eESvzHSWiIdRIiZo4nu
         lCNtiUlcOpmv/LzsKwc09ngSBL0JgSH0QCmNKULZSqS1lzHiDxmbxYG/VZDrok3BHM/4
         cEdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=y+iXJs/nPH4++hayG1ugea2CWNHDhVFMKW+QtuzUL3k=;
        b=KA8aglHfMiCLbv39eOfSRzX5H8nrNGD+vOUm7U8Itrd2SpgGmhEUwhcU2+18Em+nOQ
         kGfDpP4f/S8I37Pr6saHDOvMFTfdTxRq5MiPzsL9Qpw6dHhnPpcIqIkIAvplamrb0aVe
         UMLu+fXMklpPzsxYkMaJxVwFeKbIskH4pBX88NWYDr0HuDL9lfkxdhOsCzeGElfIhVdT
         +GH5woauSLNDkLGHY81OjUVv2q5eZvrgw7b3mKS/RDqUNtbb2gIP/gFeBYwvLXy/SGWh
         s5NvTPc8OJQWJs0K8nYRfCwPGgV5y3NdExAHJFf/Q9iqV4LZQtzCXfDu1a9MYbbJCp9t
         k4PA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ajRr5Qhi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=y+iXJs/nPH4++hayG1ugea2CWNHDhVFMKW+QtuzUL3k=;
        b=R9amPDyBcVqDm129mgbjaknqQaWBW0+NJ+1Aax5iqdin6dXQrRPCySVoKn+kFW4pXK
         7FgJ1JZpvB85l8TJnptxa9JwPniWyG7se9uwQa8NOO9cagQ3mv5paoNh9HY05s6Ez35K
         dKgSZbGTx66Yb44uV1NM+N0cgOm2J5FG/2OXrSaByvfslS4QDtLWTaXvyeKy0ZlKeWcg
         SXjD+q53C4oaP1zfQktihcWO0mzHpNBVUms4feleOMeD9nEx48xIxNvIcfgM3x4NiTfA
         JMWVW2fvCo+/Qz5VCmDBwm3oVWa6TkL8eJpa0MularQPzkpd+Mca4ZDxWs4bZLsHdrJz
         prAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc;
        bh=y+iXJs/nPH4++hayG1ugea2CWNHDhVFMKW+QtuzUL3k=;
        b=UKH/KEGWcJU1IAH4Vr8Bll6kbaBsZOzubosCx7J0GJ2SDtPwxXgkwhaAzoyswpVuxM
         OQFta+00fdXOdrTbBOicUR1yUNzTbkONw5KKkYvE4BB08Vlxg7xwhx4Vz521W9CoeSqN
         quofbBUAWrw3i9mZx5kfQpqXzzkfRgDQXTMXebz4ohTztIYYVCOgcS5hPJbRb8NbXeio
         3OZZaFgOGvp7X+BxwTYOQuNKoRw53LIG4FwIIBRttEjtDi0cVLuiqQN9zqEr+bF+C/Q2
         iZzn1lKkZcLU3EK9ESq+FCnqBegf9myW7at4N5n9rhjBUtIK6MWzDEA6IQWNlxI7kq6p
         X8Sw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo1lM5vmWeIYXK4iPfDjZhmCqdNRec2ngxvt43cqiP17j90cGHKz
	uRnAPhrVGyJLoblztONYmJw=
X-Google-Smtp-Source: AA6agR6tqe496SRPo/WceJIh/FgJ3cntGz30HXv9VrfAIAJjR0bl/I0T0x8JK9yLZc+m9+ex0Js17w==
X-Received: by 2002:a2e:a4a6:0:b0:264:41eb:bb7d with SMTP id g6-20020a2ea4a6000000b0026441ebbb7dmr2316779ljm.230.1661782052133;
        Mon, 29 Aug 2022 07:07:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3588:b0:48b:3a68:3b0 with SMTP id
 m8-20020a056512358800b0048b3a6803b0ls4890365lfr.0.-pod-prod-gmail; Mon, 29
 Aug 2022 07:07:30 -0700 (PDT)
X-Received: by 2002:a05:6512:1291:b0:492:e988:60f with SMTP id u17-20020a056512129100b00492e988060fmr6063155lfs.417.1661782050092;
        Mon, 29 Aug 2022 07:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661782050; cv=none;
        d=google.com; s=arc-20160816;
        b=uz3lU+RSmQ6sa3+sin+ClCelrFQGCzurEtldKf3fFM3DzCUJMXv2Hni8lzCNz5PNFA
         FWrp1jvfkpSuHJkGUnfKfjmfsv8vCmUcbrWGk9C7kl7oDBFrBs8zEx2nytTCaDuaX4ch
         ugyYQa6yT4rd31Ktz83c/NhzTEM0mdN+COL6wfppXLwo441uVwcxix/1N3NZBx//Owy2
         /ZiAuVids/hKJwc/pz0pWgjdL55Ev6JdHVOZ9CzqodA3YK0uIYEejv9uAFzJYzVQuh0C
         xYULPbAtudrsYT4cADP9yWjdrNnWRYnXz/DHmVaUog9Sww+eRbvLCmWr8OG0xyM7wEyG
         6vtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jL3y8DONGtrGP3TV1AKFid/B+2MPQdBmmqh+/+ddfTM=;
        b=XiUN9GaBqSGphYfl+An7QWhDos8i6wKr2etbEnGC3imJ7UogOG/HrMpys32Y86SMbo
         X+ILc4Axn44upm/V9BK4Sk25VHqqiA1ku5WNRcPqn528bw6LuubEnt5q5dnZegkabY7A
         HRGs2mqfotIoFWa+Gr+BP1RTHUWZQIC3rSrJ2uV26O/Q0JvRdngH8yNrvuF3nqJ8UyXY
         Ckdffvc6eog9q7zyoTGZX51AFbgFgMzQyh72Tqvd+F7HrJIMZl20SHCtweiqM9cSpu15
         yQAvJTZTzD52onZ5EwPMgtAI2xkTQ21eJuOyqcV0nl+ndSksd59pZK7DxyjXVR643oM8
         rFCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=ajRr5Qhi;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id u21-20020ac258d5000000b0048b33ac1b9csi373633lfo.1.2022.08.29.07.07.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 07:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.178.20] ([92.210.49.225]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkST-1pNx2m1jwP-00vEXN; Mon, 29
 Aug 2022 16:07:29 +0200
Message-ID: <7cd2922f-5553-4dfa-3a79-edaa6c642bdb@web.de>
Date: Mon, 29 Aug 2022 16:07:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] hypervisor: Add -ffreestanding to CFLAGs
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 Stefan Huber <stefan.huber@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>
References: <20220809124950.42931-1-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@web.de>
In-Reply-To: <20220809124950.42931-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9W0riXfLbXNhF/DHrcjnp3zxZh2FqHizBIiP6CjiuGYXFGLNgZx
 SuMOPWyYAFv3bvB0tJ0HaLRAMg8fZfDpEDT9SuLOsuvj4tCLUx/o1k3hxwOo1NGodQYDZyD
 k2SDeteW09fpXcEmquJM1MMuXoLICoGlxwBLbb0DIpcE48IeE+e73/RN8DJ9hzGC1ED+y+J
 TI+AiWib93+atXund7XcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XhVvUZVVHBs=:wrz7sUE4pdpaCeA2EwpYke
 V0vn6oniCd/ssaj+ezpap4F2/yeBaUT0y/QDSiW9qSfINIeWJ062Z9peP047+JTBrWXEHzMf0
 Gl9fJUrN5VQxqcmlGW/A7FDUVhP7Lpar4Gtp+MUdsVzfua6zDBLVxDjXYP2KYbN0kqZFm8N2d
 P7NEQKaW68sW5CJfSxaKRpgBX6PIU5SbHy9JnAe5lD8ddylJcI8eFkQ9q4v8Khyg9BnWAxexy
 kHls+32ReNUnB32lMSPdO1c8+6zoCvSXGh2RN7vckZqpMpBnEItp8OkhFWpwZO25ZaiDn+hea
 A2lnOJPzrnDZaCwQRE6gRK3iaik28TsaaY15P2i9R8fq5Kx4+E1zunI0ycU5LapFil68D3rit
 YqUb66P3I+lFOunmwaXvEIEzwJTv5pquRTpqRaAlkaP9upLoZS1s72UP0m26DhJl4IgNVnF12
 R+b1mV6VVd0r+pmECr9LJTgGoGg/WxiruXZPlJZyA9ssWyUpX8HtE332lxuqHh/gcNaImWy8f
 eJnTCKS1A0HN9EqnFQq0ndh/Fec+8TwyHkwweLpWFD6AI0WIHAd1gC0uDQbz7ALJjJ3au2VkP
 OfWwGIN6yvSjnc6sRL2sVFFvRIl0ye54P+UM3f/4V/634WATXVxiuOmWuhrADH1rcbLyoSSvS
 5NMoWZQkNvFidDmVB8hlcmkW5IrGTbhaaz1OqKSynxN1qf2FhIEUzh8uLMW+vhPiRp/qsQxRc
 ej0COtiL++cvpwLLmzs4VDSpkU08CyhJBUE5pqiNPInvSmFKo1/Tn7an5L1fxUgaVKgCbMbKk
 ZQbryDVSX1oGOwl8Y9K4l+RCmcI1yBTCah/da7O3lVM3JPtk4ie3KVh9xRbezdy9kkoh1ZaaW
 YTxMub144m27wnGnj56v68PwrnA+0b+9qZ4RjZPALlUQlOcFshbjvtZbhhCqEWP2gPYKfVunb
 qL67zhCdYJdWNgQ89vvy+RPHrGEWTLOmyyTH+7fPiEQ7kV4/Vo4aOafJ8+JEodhujOgnaOrtL
 VTsjKuh0CTcr+Pofk53m8Y+ffv1P+hR9M5kJBnVy2gBOxsOkJ2FVxpmduBI5noawmu4BRwa56
 uE025g/zN9tNYWHyxwGbHiquBing13rVY0Sfk1/RJW3IY+PWCr8aiN80A==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=ajRr5Qhi;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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

On 09.08.22 14:49, Ralf Ramsauer wrote:
> At the moment, Jailhouse is - by default - compiled with -Os.
> Nevertheless, at least we should also support other optimisation levels,
> such as -O2, without breaking anything.
>
> Turns out, if we compile Jailhouse with -O2, GCC creates endless loops
> inside memset. What it does - at least on my RISC-V port for example -
> is to emit the following code for memset:
>
>    ffffffdfff00a6be <memset>:
>    ffffffdfff00a6be:       1141                    addi    sp,sp,-16
>    ffffffdfff00a6c0:       e022                    sd      s0,0(sp)
>    ffffffdfff00a6c2:       e406                    sd      ra,8(sp)
>    ffffffdfff00a6c4:       842a                    mv      s0,a0
>    ffffffdfff00a6c6:       c609                    beqz a2,ffffffdfff00a6d0 <memset+0x12>
>    ffffffdfff00a6c8:       0ff5f593                zext.b  a1,a1
> -> ffffffdfff00a6cc:       ff3ff0ef                jal ra,ffffffdfff00a6be <memset>
>    ffffffdfff00a6d0:       60a2                    ld      ra,8(sp)
>    ffffffdfff00a6d2:       8522                    mv      a0,s0
>    ffffffdfff00a6d4:       6402                    ld      s0,0(sp)
>    ffffffdfff00a6d6:       0141                    addi    sp,sp,16
>    ffffffdfff00a6d8:       8082                    ret
>
> In the marked line, we end up in an endless loop. The reason is that gcc
> recognises that we're about to implement a memset, and tries to take the
> shortcut by replacing our implementation by calling - guess what -
> memset. And here we are: endless loop.
>
> I don't know, but this could maybe also happen with -Os if they change
> optimisation strategies.
>
> To avoid issues like this in future, better add -ffreestanding to our
> compiler options. I wonder why we were missing that option in anyway.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>  hypervisor/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
> index c475b8fd..b35809f5 100644
> --- a/hypervisor/Makefile
> +++ b/hypervisor/Makefile
> @@ -32,7 +32,7 @@ KBUILD_CFLAGS := -g -ggdb -gdwarf-3 -O0 -Wall -Wextra -Wno-unused-parameter \
>  		 -Wnested-externs -Wshadow -Wredundant-decls \
>  		 -Wundef -Wdeprecated \
>  		 -fno-strict-aliasing -fno-pic -fno-common \
> -		 -fno-stack-protector -fno-builtin-ffsl \
> +		 -fno-stack-protector -fno-builtin-ffsl -ffreestanding \
>  		 -D__LINUX_COMPILER_TYPES_H
>
>  include $(src)/arch/$(SRCARCH)/Makefile

Thanks, applied.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7cd2922f-5553-4dfa-3a79-edaa6c642bdb%40web.de.
