Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFVP2X4QKGQEEAZXZKY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 31183243C35
	for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 17:09:11 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id o201sf1332631lfa.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 13 Aug 2020 08:09:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597331350; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ddo+1yHyfa29T5/xiSiMxId7F5Q6Sc3oAv+VC5VDS7mdEdLaBv3qoQYaBUFcj6remj
         8D4KLTcN9gHiEmrFkllMJWUWRwr9UFIaBbklAEYm4iRZuZD9fAustwURoJ4vsJhurHDL
         DW4LxLTvsUhKn4b89OC9gRfzfB5Uu/TmKk2m6ZtyOIFDsXr2I/ryCekr1VG3H+9/0j4A
         32UgrRNG3PZ4nG37VpqKwivOxtTN8GyPUQJROzjmYI4bmmDq3dK1Lw5/DA+k6ViiAANI
         4cyN+mVCocE+cMnpNlMDn1Vhi2jNKw571GmeYgJ+3IlZ0zvOyOigKb95eOWcgKSg9o0/
         bFng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=bC17fhLRx7tv/AprGCu6p3ZAG644wCQmBVVsXSTj8p0=;
        b=GLl2cmXP+bpPPMWY0bwbiW5Iiaf+MupA7s8wBodDrdHbzG6drD7QpPJwh7yR+S05nt
         1IhjJMeHzJbPKoChOKVv4jERldzw+YxrS61gHGxq7CAid4EXznwzoDtkaXGmw77HdcFR
         yMbMfajWudBUSZPK+AsJD/XKlhz7aZGtNW+wMix+zTZJ+FIXqFJahQ9BOo9KWeh8NSKM
         6yjsyZ1KylFyKxxQNyVY2R/alom7gzFc1X+Kd+cFYAtCD7CMWgfE427Yh20f4pZkxiEb
         RyIq56WB0lSYP5j1zhawK/EhZHv2wLy+xYBI8ITyklzPqdgaj+jlPFeDam5dNAtrXa5Y
         BPxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bC17fhLRx7tv/AprGCu6p3ZAG644wCQmBVVsXSTj8p0=;
        b=WVfJdeDwQi/7/cSWcQ07JGKiKI79LZHUEGdT7azDzpn6kN9GAGqny0qic0j7/4vXjV
         uTt1dItR+id4RgkDOBl/6v8ZBSZo8PRqbNY5bx4GOHxjldLJmNiAN/z/MaelnmRH7gb7
         zmyMqG5yjHhZ6IVBiBVGFxs6R/ry5VRqzopfb2WEEY2ZPBWEI2MI5dgYqIbBfnzmq3Ym
         2vGhUFt7y5RM2+mdI7uC1GAmsWnAGYRbDGuWq9afmZx+OU+F+dm0CJ3lr17SvZvJTjDq
         S8NW0ykTM7rmTzEMilhjblTZRowlhnGVLlfzO39s4AgMheSHI8ObZyBrs27Qw+KLSKUN
         RMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=bC17fhLRx7tv/AprGCu6p3ZAG644wCQmBVVsXSTj8p0=;
        b=oq3qisNgWvDpgSx7kQpWsXJdnC+iftRBLJtAUdPHrdo3dYo36aVkgKz4HbZYfdXVpY
         jbWeUDmYvcHbiFDmqMjzMYiWBjTKG13toOg0pUaLGIY/24R2F1MxkzHE8R/YnmamfJ2+
         R9PhW1Sg4SpUFe4rwBYvO6esTimbLm+vE66QJugCQVLuuRNh5q8/oZsjbxoBvnwnBn7a
         5f7na7qpoRUBqeRcjV7XN+C+zvXnqdALWGc+BkGCkOofFUKp/0K9//EATa3O8AQrM9yQ
         YHrAQDamyY3kT+INYee8VhIGrlUP8coNbAKtTx0gYAWP4m+9qS+I8xDG2mo/CkTyFSHb
         ce8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533qaAZ8NBgPIEBwIAjBV4iLeBTuM1KLBkKgTXPdTerdT1ggZ7Jq
	27QCjhreX+oEdQsqzpZfsKA=
X-Google-Smtp-Source: ABdhPJxyq9mI1Y45b7Hm31MAQyAR4V1s5SX1Pxa61oT6KSsjZvcmDHCE+CkQB/4IRbwdCawAPwQWfA==
X-Received: by 2002:a2e:9595:: with SMTP id w21mr2359725ljh.334.1597331350679;
        Thu, 13 Aug 2020 08:09:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1182:: with SMTP id w2ls1160073ljo.2.gmail; Thu, 13
 Aug 2020 08:09:09 -0700 (PDT)
X-Received: by 2002:a2e:9743:: with SMTP id f3mr2314841ljj.299.1597331349477;
        Thu, 13 Aug 2020 08:09:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597331349; cv=none;
        d=google.com; s=arc-20160816;
        b=kSXXUy+OFRiN5dvz3XN1zqcg02OqECekNjyyzG64NHz5pFd3ujRfiGi5OexLJjHCyQ
         7sfsWifT7A0nGh6yz2wvKUz+gTqQ4ZQwC4T3KCpZNkcHPn7us6vykU9gWJpnrbangU51
         HHy/wVMLcJ3Au/AIxzKIMpiEF26u9tfdftdI5S7VbKih1F2xa612WmIwThX8a/bJo2eW
         AoSKOFPIDJJC+A5iP+1Ysh4x6CRIjlREOc3PPCgfnjtJa+7Wssnw/YfvHuP+GcQPPs+l
         09xXyST3ubEkrcfEKbG7PJKR62z3SB9WklSX8fjQskV/Ev7VR0PJd8fflSwOKp58r4uU
         VCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=VCofvDPTGFXRsS6ybGPuWg3jRmCReB/Gf2c4Jxtqy44=;
        b=sATBpqxLj+3JKWcQCV32+qJCk3/IZvWol+6ony2IW+xRLwdqFS+mGR7b5GJN13aHWK
         gVCTQZ0oGBWEXs28DiD2uDFGSH25+tFV6az5X8z2dilTnWuE5SVoJcgaefzWv0XV9rl4
         l3oUcDmLppZL0vX+rQUE5wnM+Lh0UZGmOj3zcPvMbl6uIhrR3cM1XOujkFt0bCBelA/O
         I+esk2NdIOSBQQoojaB5Q64BywgoP/i7RnRK2XK2RtrrZ0DkxJRHky4eL+0mNak0/lNH
         bMEISgKf54CKJyU4y434Lu9DyNzMcBWS4j8H2jdZbKTh6yKb1UyBCAWiwh0KfYdE36p0
         fGxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id c27si393304ljn.3.2020.08.13.08.09.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Aug 2020 08:09:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07DF970U006314
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Aug 2020 17:09:07 +0200
Received: from [167.87.13.5] ([167.87.13.5])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07DF97ne026714;
	Thu, 13 Aug 2020 17:09:07 +0200
Subject: Re: Starting jailhouse on real hardware without QEMU
To: stranzjanmarc@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
 <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
Date: Thu, 13 Aug 2020 17:09:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 13.08.20 16:02, stranzjanmarc@gmail.com wrote:
> I have now extended the kernel command line with "memmap = 0x5200000 $ 
> 0x3b000000".
> (The hole kernel command line is 
> "BOOT_IMAGE=/boot/vmlinuz-5.5.19-050519-generic 
> root=UUID=0cf2de21-3396-451e-bdef-b1269f666db3 ro quiet splash 
> memmap=0x5200000$0x3b000000 vt.handoff=1")
> I found this hint in the generated system configuration file.
> 
> With the call of "sudo jailhouse enable 
> $HOME/Projects/Jailhouse/jailhouse.git/configs/x86/sysconfig.cell", 
> however, the whole Linux PC "freezes"!
> 
> What can i do best?
> 

Have a look at the debug UART Jailhouse reports to. It will likely 
contain some access violation of Linux because the root cell config 
still needs some tuning.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6e9595aa-ae7e-8808-9335-29dbe7345ad6%40siemens.com.
