Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYG4537AKGQE5UI6D5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93e.google.com (mail-ua1-x93e.google.com [IPv6:2607:f8b0:4864:20::93e])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8962DD934
	for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 20:15:45 +0100 (CET)
Received: by mail-ua1-x93e.google.com with SMTP id b38sf5619467uab.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 17 Dec 2020 11:15:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608232544; cv=pass;
        d=google.com; s=arc-20160816;
        b=tS35iW4p+2UwEqTgojOwDfANhYT/S3oNTHxcb30hJhBr4P5mGGnocEA3yQXUKer3gx
         6xRWrWCyGccZgQRQgnkjzMyrV6kFVR0Jc8ldY4P0wda2ZO8O4SgErXfzFYWGu+v68BS7
         qo0pFaPY4ZrnjaddyGUPwKENQqMVdAHie+R3N3HK3GSky7+5hEJ86IUBOFXS8A2v729Y
         1xeLdhD7to0uqbnu15POiT5lOPkbidp30ltbx7oVXxKrS3FnHhSmAL5cg+gVQCTVJPEX
         yf+evhNDsinNKYljqCQB6xjKAcxMVOTnT791HCA/bLsh+n0leSB1DPbCsagxe82pMLF9
         pr5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=um+8y8OCx6iOYez7DVTtBYg16nSWrMNt1TPrIG/Y2oM=;
        b=Z532S+4HvdPc7DScoYMSwYdu8191ZaTCYOrpLpfbincDxWpBB828MKQLx5dfPVQxpa
         cSUphP3p2DrsHkhOLv2iaMjiZbhPZwpKt32Echp+jYRbMDt0Jo6cEA9kxGBlq27/ILa9
         eiR4gU1QUBCITcOzBU+PMKFZOmNQpQVpRGPBQ2yXVKfMJckqxqKiMTFWhKQaBv23+gQS
         +h+IRConb0HmZZuOkKTKSksWFjcvlkrrT6ogisM5pCb2hkdCYVbTDosMH7tDpdjahC7Q
         drj6NOzcXjGnszr8NcfTrEz8PtTCOfYRpodbaCH4e5Aqsmuh4WzCPG7GfxuUKufqA+bi
         vN6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=um+8y8OCx6iOYez7DVTtBYg16nSWrMNt1TPrIG/Y2oM=;
        b=XCw2KMg5siVIo8xhfqGKtR8lbgYs77kNkIUBQZUH/R6RgWFBBahGCw8pP0tMw79SAR
         1rR3y/gQAswDCnxSP8Sx06OCUscjobnA+G8tjKPTZljtXhU4isv8aLCSzx2hFpivm+uW
         g7DPZULFnqWBTdbJkJPqV8hzMymQKrBWcAeInSmIQuaTwBThE4h2UZ3K4i7onsfeoEqU
         Z1cQRmSSDUsqvkrj3RCy1PuUzrpOAWDlcBZxYqM+TmUr/RdevWa7eKWwNHHdeyCD4pbH
         PKtFdfnSrnuSBySC/WP4yr0RB2worUqLbwefQ/O0zhaVCMCQUfMUnMsoABUKYRPFkNIm
         uinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=um+8y8OCx6iOYez7DVTtBYg16nSWrMNt1TPrIG/Y2oM=;
        b=h6bFOXkCvn+4NhrJ/dLv36wqK2LQQxHxL/k5Flz7waGuVuUN3IXVaoOXnna/tg0hlc
         AvkmctPKEVR5caV1z9mi3C/57p390syK6gjeP0XBJ/wx/fLUYzlbk1FgbPOl5ESJHilX
         7pU+xeN2SBSbP/GTBHzEJMJ3ekL5Ui044BGCFynQLLD+3SPEc8Tsb1QZqq9pdSZSAtIc
         jF1j8OD3VtXBQ2Jwe44pn40554aoq6ag6NiBybLZH+zdPosyjFif8AiM/BbGV4hg1WyJ
         VaSJv3B2SSOAGwwHbhtTK6HgMiJqItYYPsBPHsu3J++33UNNTw7b9mMmm39LnOr7mhuH
         3frg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5316TXsVZ/9jQQLr0/lXT+M9K0QCFR0YU2G/P2EW36tVcZGSz3So
	19Y3zZT8ANwP+IJf1B92zIE=
X-Google-Smtp-Source: ABdhPJwzRpnlgL0Fzw0e+h5P9Q8kN6sQDEdCj6OOgyKTAa4RtQyzFuI3gKqFurtYbYDYDpGqUnOPQA==
X-Received: by 2002:a67:ca84:: with SMTP id a4mr1013225vsl.2.1608232544451;
        Thu, 17 Dec 2020 11:15:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:ea12:: with SMTP id g18ls3597097vso.9.gmail; Thu, 17 Dec
 2020 11:15:43 -0800 (PST)
X-Received: by 2002:a67:6304:: with SMTP id x4mr723087vsb.23.1608232543867;
        Thu, 17 Dec 2020 11:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608232543; cv=none;
        d=google.com; s=arc-20160816;
        b=keX3/DCkvW5i9T8+B1lAc26gPeSlrDtteLkGtStybVb7glm0pOj4C7wZVF+e4HvB2x
         qnXR3iyMIJxVlw3Z7iOWuymY7gQzOupxlMfLfpfmyou5gxoIs+th5ii06bMWXkqT71pG
         DQdRoGSYBP1LLYkKcY0WPMXDuxoNh392n77+e2ywFFXhTs7SzmmmPSVbZ8MoGnVPzxHD
         2xJ+ZTXaX2mNt8aCstACfz1evBw18kuMsY5gy3+0vVrBQKQuR8jgkqJcfUOlQOXZYtOE
         cAFFRC6tqHOXYQyHKw6fCADpctGVWpvOlm44y8uh0DRKnwbZ2glcj8PIW9LG9eVyri82
         mA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=noDTbcNFTG3/QfqcEInUQEQDtYAWwPlPus+vTn5bylo=;
        b=CS4606o+6E2cN1rIpx7E5NutOCx+rqZaWxLU1F4se8HC9yA5NI+YYQVywcXuSuvElz
         mFV76i32XoXaqSp05lWWBPMkLrUNwieMPV244UVFr3p/pPLPFXakSemQ2ZIyj2Ks7hEs
         FE5gwC0Ln/OEs2FmEPV9XnRfcrz01+pfghur5LrwX2wXsd20a3ayA1F1iLv01TxkLgZz
         SESbKqVsrLiehvuCtAz+ffmzrD/yK9KdHwdZy+Etajp8Y7R3S4fe7SHr0IF7/9xb5Ac4
         ZDJ6rAwPllcnY1sXWvwCs6gqQ+cbr7yboDIeTd3/4o+xsEjt6Hizt9CuHVRtUgXVczVm
         Ezlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h123si182150vkg.0.2020.12.17.11.15.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:15:43 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0BHJFgVs022214
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Dec 2020 20:15:42 +0100
Received: from [167.87.38.225] ([167.87.38.225])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0BHJFfvh015236;
	Thu, 17 Dec 2020 20:15:41 +0100
Subject: Re: [PATCH] configs, inmates: Makefile: remove .note.gnu.property
 section during objcopy
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
Cc: bram.hooimeijer@prodrive-technologies.com
References: <20201217081814.8338-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <2f6ca9b7-d0d5-0663-35c2-0cd700ff6c02@siemens.com>
Date: Thu, 17 Dec 2020 20:15:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217081814.8338-1-andrea.bastoni@tum.de>
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

On 17.12.20 09:18, Andrea Bastoni wrote:
> It seems that the .note.gnu.property section is interfering with objcpy and
> causes the "JHSYST" identification to be removed from the .cell.
> 
> Removing the section while copying the .o fixes the issue:
> 
> objcopy --version
> GNU objcopy (GNU Binutils for Ubuntu) 2.34
> 
> readelf -a jailhouse/configs/x86/qemu-x86.o
> ...
> Displaying notes found in: .note.gnu.property
>   Owner                Data size        Description
>   GNU                  0x00000010       NT_GNU_PROPERTY_TYPE_0
>       Properties: x86 feature: IBT, SHSTK
> 
> hexdump -C jailhouse/configs/x86/qemu-x86.cell
> 00000000  04 00 00 00 10 00 00 00  05 00 00 00 47 4e 55 00  |............GNU.|
> 
> objcopy -O binary --remove-section=.note.gnu.property
> jailhouse/configs/x86/qemu-x86.o jailhouse/configs/x86/qemu-x86.cell
> 
> 00000000  4a 48 53 59 53 54 0d 00  01 00 00 00 00 00 00 3a  |JHSYST.........:|
> 
> Maybe related to:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=906414
> 
> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> ---
>  configs/Makefile | 2 +-
>  inmates/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/Makefile b/configs/Makefile
> index 513b0a9b..0e617e4e 100644
> --- a/configs/Makefile
> +++ b/configs/Makefile
> @@ -23,7 +23,7 @@ ifneq ($(wildcard $(obj)/../include/jailhouse/config.h),)
>  KBUILD_CFLAGS += -include $(obj)/../include/jailhouse/config.h
>  endif
>  
> -OBJCOPYFLAGS := -O binary
> +OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
>  
>  CONFIGS = $(shell cd $(src); ls $(SRCARCH)/*.c)
>  
> diff --git a/inmates/Makefile b/inmates/Makefile
> index 7d3fafa0..a4ab7903 100644
> --- a/inmates/Makefile
> +++ b/inmates/Makefile
> @@ -36,7 +36,7 @@ KBUILD_CFLAGS += -march=armv7ve
>  KBUILD_AFLAGS += -march=armv7ve
>  endif
>  
> -OBJCOPYFLAGS := -O binary
> +OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
>  # prior to 4.19
>  LDFLAGS += --gc-sections -T
>  # since 4.19
> 

Thanks, applied.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2f6ca9b7-d0d5-0663-35c2-0cd700ff6c02%40siemens.com.
