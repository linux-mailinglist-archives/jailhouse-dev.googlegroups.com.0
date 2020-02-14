Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKPTTLZAKGQEOMJNGCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DE15DA6E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 16:15:53 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id y7sf4041958wmd.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 07:15:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581693353; cv=pass;
        d=google.com; s=arc-20160816;
        b=lyi5yNOuKXFJ0+cC2K1Kl0mwAVz/A65HN0m5ylfY3LQzlwF4EKpu8baLyDjegSox+h
         qpyQ8tBLubd7rHCgXc0eYrrYejs7F4pSrLUW0abo4V12JaJ41JcTmCGZUJgWAHbXx3FW
         Jke4kHAKPxDdajl/qdzWU4KBstzswemItv1HWpJfAD+wzG08d7375ziY1R1bBtGOt6bY
         4x0xNTWV64GrC5u8vlrteTlucH1MGX5/Ptw635uHb2P49YxNNhGAkYHQ+tjzywNieONw
         Pol91u3U6sa+k79SaGoioKmIJMF3ycaMFrGngOv0Y4ocU/qoUDtllktLYjcp4pgH8fHp
         CG/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=xwnAajd0JjEj+idPpf1hLXyev9QFjXQnQUTJP5I6AlQ=;
        b=WuuBM4z7kX6SUaBjHLbTimJeUp5NCsILjknX+yKKG4z/ooriD+19jXUVlacZQQjGe2
         ZBEfj9IzQj02u36LleuB/MolNlxX/d8bEN2nXEws8BaH3FcMnQ1lMsnCjCsaDfMLZBNE
         oa8e0+PR955aNHTUM2PfLC886w0IRMM/ancqCopQLCtqwwp4TDlOj3U+E/fkKqsLFqCL
         phzGkFQPXDnFpd2LI4ZJvz2wKTjOosGgnFB+otTLPQKhz4k+2QJXfehnSV/yoEI/8fGI
         LawrWpChjHx5hu6vuGZvMSL5wS9wElCOrVsECjGtAz14mWBGcZp1LlR8SsGzGocQ9x6D
         nCAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xwnAajd0JjEj+idPpf1hLXyev9QFjXQnQUTJP5I6AlQ=;
        b=cMF5s+S0gzHIJNOLxXjuFDRM/h2gFydLNFkDPEB155/EHdG/DH1dDUtqmFixemH453
         VTZok3hB8PFn+zHn21+GZepxLTSR+s9bmivRKVtFtx5Nj7THLGouAUTdCLveErpeUZCq
         7D33OaYx+Vwhp5DsRBbkTQ+vSSOSS3NQAbao95+hQJzTN2fgab7XET5OQoRHlOtqw7kD
         67eLlj5U1tITrzeO/Oy9hr8E11LUlxdx2tyWw7kTPpyCzA4/myYqE/3gh44DKd2ayqvU
         dbhCb6oeBRtDyk61an3Kiq3tJGjFd4NQPXLiBR+eXliFgAKtY0O92ymsQnqL+7FtcqHZ
         HG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xwnAajd0JjEj+idPpf1hLXyev9QFjXQnQUTJP5I6AlQ=;
        b=lJvHBJs3JpDzNgR9lCJ3ywXHaFarbl+HNCad1g5gMGYG8ec6ERc4tsdK1A1BgUQvhn
         +5EdQvYh8uPc4MyI2T+/yuyJuwHxugvBkWc75wy/RtD0Sd4aibzGeW/Y77TQXXpZjpHT
         2sp77EhlECR7wWvi2E6QTWmcHo5p5wkr8x8+pt1RbaTT5NWmf107Wx0cQcXxDIY3SLIc
         evomL95rJy6687GhWobX9aVNEi0DzM4Ay29KJIjRIdA4YT7iSgY8LrdbYX2OBgdYtj/S
         MugImn4OYtYn1eVgW47O/PfI5SIMZYCbOaD09b+ScFOsMRzrBk5Biiw1zOu6A/Rw2NNK
         +VWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMhm2aNrDtcVG8PJPiJM/8nc1fD/NhWUKEVB9QPSDfBK8Q6j9R
	vr9wrw930UnwQn/qLRyqxhM=
X-Google-Smtp-Source: APXvYqy/6eDeaR2TZmkvNTE+LvrKthaGjGWLOZ2EoS45qNhxYdgqCYUKHXSmI1CKNXFMnPJt24pEPQ==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr4795961wru.57.1581693353669;
        Fri, 14 Feb 2020 07:15:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d13:: with SMTP id g19ls726494wme.1.gmail; Fri, 14 Feb
 2020 07:15:52 -0800 (PST)
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr5552105wmk.68.1581693352889;
        Fri, 14 Feb 2020 07:15:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581693352; cv=none;
        d=google.com; s=arc-20160816;
        b=JvJay4h9eK5JCcnHgDgcH17pLK+C3gsAU6mB+2v4FYI6QqD/BnL50KDKu4LJ8S/4Md
         1q0awaO6rrAMwxrXShtHelyxMs9kQ3A68/FaZAs03BVzf2vDH86BjPuMJRifUFgI4dOW
         +pt82R6scgabfV82tTeJuTCbWswZxmMrvfzB6J1KxrtOvjQCq1qJFtgSAI3LU+vu0mCk
         GNeYmAUAOYOrkauBz8FMBlDgQeZLFxJ5ESje2lJCFZ1lk1ZC/mAMaOwD8fgW0GTpe8cz
         /PvlsjCCUK6bM5fhXxvZ1Inh3MGgWK2M+YUkgwRG0zdUj4BvaXXbywDcP0LPL4pL4cNc
         ViDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Cb18wcTjOukDwHCWazN8DMB2f4u8sYixi/dJiCs/AdQ=;
        b=V5x0oPHBmqECJfo7IRS/PZYdC70lhu1+9IU77oWAMUGOlhxlveC8w+UMbcZxSS1vXN
         5ORPgwx8zH8e6teMevbIfv3kQ2/mRdrG5Sz88HVEl1GlpLfiTpBQ31heY0AOxEc+LU71
         gUDcl1VMPqkJq3uTN78YQOenWDq8XTLqmtt+p7HN2Pm3Iku4INOnQwymqLlIhxIhE77h
         yOe6Ni5Hrp8EAPFmBJqZfYGlDuCKpIGnNgoNZw54V+LV3fCspDsMe5Li4Ipfhn9KJlw0
         z5WuVNL5IECKZgmGjGWL7u9Drfy2BYDcIQD3IegJp+KZWXW8g1Sjer0Y0r3NOINL8fNW
         hdkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i18si269441wrn.0.2020.02.14.07.15.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Feb 2020 07:15:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01EFFqhP026548
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2020 16:15:52 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01EFFp5C003365;
	Fri, 14 Feb 2020 16:15:52 +0100
Subject: Re: Linux non-root cell tooling
To: raymanfx@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
Date: Fri, 14 Feb 2020 16:15:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
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

On 14.02.20 16:04, raymanfx@gmail.com wrote:
> That was indeed the issue, so thank you very much for the quick response!
> I'm now facing the next problem:
> 
> |
> AddingvirtualPCI device 00:0c.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0d.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0e.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0f.0to cell "linux-x86-demo"
> Createdcell "linux-x86-demo"
> Pagepool usage after cell creation:mem 375/975,remap 16395/131072
> Cell"linux-x86-demo"can be loaded
> CPU 2received SIPI,vector 100
> CPU 3received SIPI,vector 100
> Startedcell "linux-x86-demo"
> FATAL:xAPIC access inx2APIC mode
> FATAL:UnhandledAPIC access,qualification 20
> RIP:0xffffffff81649d42RSP:0xffffffff82a03e98FLAGS:10046
> RAX:0xffffffff81649d40RBX:0x000000000479f000RCX:0x0000000002410067
> RDX:0xffffffff82fbc796RSI:0xffff9de180000000RDI:0x0000000000000020
> CS:10BASE:0x0000000000000000AR-BYTES:a09b EFER.LMA 1
> CR0:0x0000000080050033CR3:0x000000000240a000CR4:0x00000000000626b0
> EFER:0x0000000000000d01
> ParkingCPU 2(Cell:"linux-x86-demo")
> |
> 
>  From what I can gather from the source code, my system is able to use 
> the faster x2APIC mode (programmed using MSRs), but Jailhouse is trying 
> to perform MMIO accesses which are only possible in legacy xAPIC mode.

Check if your non-root Linux comes with CONFIG_X86_X2APIC=y - I suspect 
it doesn't.

You can find a working x86 inmate kernel config in 
https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4 
(multi-purpose config, thus a bit larger than technically needed).

> 
> Is there a guide somewhere that documents the steps necessary for 
> adjusting the linux-x86-demo cell config?

Nope, unfortunately not. The mid-term plan is still to enhance the 
config generator to build also non-root configs. Any contribution, 
including "just" documentation, would be very welcome!

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5d6e66d7-2a25-1678-2ff1-247e861ab8d5%40siemens.com.
