Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2H25WWQMGQENEGX7FQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id AB063845616
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Feb 2024 12:15:54 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id 2adb3069b0e04-510222349b0sf659489e87.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Feb 2024 03:15:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706786154; cv=pass;
        d=google.com; s=arc-20160816;
        b=PZQbxJYFRc3OiAr3tiWdZ0BU0vkzjpJ/UPF6cg42tCKqIMia4PIH9l0o6IJt8LPIG3
         tyTJoV9MMeB1Czfb7qDYeR7ojDYipWp/rYjLzuW0UrYmHJigvSHxR+LjN+/VH0KKybQJ
         FU9dPQ3n0c+dtJ+sinfjb3blI+a18QRGqY/BTDp4LRMKqzg710cqFZfUYFCSU4Z8Momr
         Zgw2wCP3Ln0ruX7T4RXuKjeM0MSAlxPakyF83zzwLI3hCowPyqsD6xVN+LtZECYgxv9M
         kOwibF2nadouRXeryZ6oJuWdAkUBILBImJhJaUBtGUN0todj1HnQyeALF0R8kKGpPf1h
         ioGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=ZdgV5PebAQ1tqPqukKwO3lU+hemloDCUuA01eypycjY=;
        fh=1C+VrUqYEU4+qPywy6RMLZVsS2tBP1Ql9w0YWIQ7Fag=;
        b=pI61+fqm3cS8X8BoZaRp9UEGYCelhBpILGWfqHGFB7DuiTiWSVSL/hVJoBlwmXr72l
         RA6Pl9wi57DjkdlrlIHa7/BrllaCzZEcNgWr1X9rpIYO8oxxB9+iZSIvWIhveTQhAlRY
         EQrFGPTl9Q1PUqYdbkd6btiHAzez6WbnHKjkEXd+5pZpZqsIn2NmKMO9v7ERKANLNxYh
         MFbaI3pKii8+DALfXjFrRm/m80QzdMbpxrOT4eKCOwm1DKamES4aO/wzBwB2/caRJzgb
         gMT2QZgQK8QcaUVwLMPP3MLMlqhmxHhafNqw2FkFa7MfCPNtEW2We7pqTGWW/Plkoj5b
         TVWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=twrIod2y;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1706786154; x=1707390954; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:to:content-language
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdgV5PebAQ1tqPqukKwO3lU+hemloDCUuA01eypycjY=;
        b=FJBBLiTECzAS+BD7qWSuIITgeL2QPhrv/vpq5yvdIxGqTS/JkyZ3Jxx2uq77k0eSje
         teSZfeTaHFZcVYvIisVTxnU8To9NQAcl3fMZ72GX5Gs7GV2tDMSqia7uuSWeDBybvgZf
         bxuNCcQvEhsShtMB0X3ZEwL9/Mg84dL73Vjd9MqdOwU7H8qGWimrOkE0Km3a8XW15eks
         q0BSG7iia0Y8OP/IFWb3m3mgEXoRzhyqM/8+cw7tDRZJOBKbfy5+OqeqN8JD/gXWHqaI
         ypcXiezAJxtjMRlO+dGt0nRjdtBfCGeUXPpQ3YI/bzZPiBqJVl2I2ZSPqnyRC0JJNLqF
         UUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706786154; x=1707390954;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-beenthere:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdgV5PebAQ1tqPqukKwO3lU+hemloDCUuA01eypycjY=;
        b=vvxoDJwxaVanWHsnGNMYLCOCxHekaznaTtRca6Chy6Nup/12xsAUt9NgMM/LeeYQBH
         zdeSfyJ1oUG7v7lCLX8kw2xdosNPZ8ijS4rnYokZbc9l+R7fMuSb4/XGs0e0Tyk9SNba
         AvxuRpPPS7iDqOPJJ3qQTX71KDDSqt+fpLl+amLlIWcnxJFvax9BzT21XbqAXhGfVlGG
         HbG09jvgt81vvFpEywKGG8d182rYVN1ePnAxWrYZSKWDkEBG4csB3adKPgNNzj+5LbLq
         XN8MzKIEGNNjiJ28v2hq3JLCHGdKNjC32DdJvM/MXvJlvY9TrqpIk0+mgwN/jAmw/CZs
         pI1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyLCWWqqFlFk4Ae060WOp4uR2IUh3UGV5xrDz+MV/ti3Mo5ege4
	PderXEO/y0t5bTG8ix24gVrPgxMFXPPQkbPzqtghL/tJBO/uF7V8
X-Google-Smtp-Source: AGHT+IE3Tvelb7PcL6Za45ARMM+6joVOIYKNuaBslY8ClCd/n86XkoMdP28PS7G16XsuiE3bM6eXww==
X-Received: by 2002:ac2:5101:0:b0:510:1b65:dd97 with SMTP id q1-20020ac25101000000b005101b65dd97mr1343661lfb.17.1706786153509;
        Thu, 01 Feb 2024 03:15:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b9d:b0:40f:b5eb:eb74 with SMTP id
 n29-20020a05600c3b9d00b0040fb5ebeb74ls364546wms.2.-pod-prod-03-eu; Thu, 01
 Feb 2024 03:15:51 -0800 (PST)
X-Received: by 2002:a05:600c:154d:b0:40e:fb93:96a8 with SMTP id f13-20020a05600c154d00b0040efb9396a8mr1764854wmg.34.1706786151045;
        Thu, 01 Feb 2024 03:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706786151; cv=none;
        d=google.com; s=arc-20160816;
        b=q7R9xTYwpAnAk5Diad0jd+hxvHLHfMnSGaLNPq36tG3JoFT8/1tqJqddoTpmMVYyAy
         aUkrXAtmASCOz4Z838tnvjGZqF15H6EFUI95m1UEdgtgKU7C0dZbBPXHB/3+6KfU3nrW
         5PPlKcY0V/zrIyTJHVRfyaGoiWrI/U3SXahgrHEwxi6K3OTXv56Q/tOm58sbPK7tdZhI
         MuAq8tfEcw93UYX2Mrxm5zQFGHuKuUnziH2j5iUq1wgskK6LSQ+nSx/a9K8jiLz20edD
         uzJIYHe6BPpmckrYct5qdLcIt1ms6i0PqKDukOKoY9e3QzXqKwRowrvWEI84W4ktIsKr
         c4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nelx4DPEasGxMah/QqFLTuYnsXg2NDUuWe3K2DU6j5w=;
        fh=1C+VrUqYEU4+qPywy6RMLZVsS2tBP1Ql9w0YWIQ7Fag=;
        b=SXbdER0qwg3yP+EcFnXx+uKF3/gAjsWjEFu2Fl3HdZ1IzdDwYQQhDk0SFc1KuveF9M
         THg2lcGpx158xapOJB0Cqju9TWmkSOVPix30/hm1xQNHL75Qgg3ZEX6yqxTjI9x/MO7T
         YgbR3pbj95mkvaWTrvA8b3TJAhCK8kuJNGco70K81jU0u/x1VRlgOOtR0ZftlutSd2Qn
         74PEIEH50iaVDFEiVionaL/xf/v3/bLPN3lF9VuTEQhzPUgFWN3++9Sx9c2TWN0Mtv1h
         uzaG8DcCPyKXRFgpm5Y6PB2Hw9Oc1wgt27El+TN4mPVyjOJpxfTvFk7KNv64aI5ykSJ/
         y/cw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=twrIod2y;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
X-Forwarded-Encrypted: i=0; AJvYcCUF7eGhs2HLNDszNRGP+bTbvRma72zFqKM2SPB3MVt/qS3BZjSEf665ODTVG+i+V/G6wbguazZkSyvlfh3q/Qa72FvxPASCimQpOsu3UYI=
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [2001:638:d:c301:acdc:1979:2:f4])
        by gmr-mx.google.com with ESMTPS id t7-20020a05600001c700b0033af33b4d72si31411wrx.1.2024.02.01.03.15.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 03:15:51 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender) client-ip=2001:638:d:c301:acdc:1979:2:f4;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [194.95.104.12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id 3BBC32E0153;
	Thu,  1 Feb 2024 12:15:50 +0100 (CET)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4TQbtY6HHVzxtH;
	Thu,  1 Feb 2024 12:15:49 +0100 (CET)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 1 Feb
 2024 12:15:49 +0100
Message-ID: <338fb8b9-c069-42c7-a0b3-48dfc5bb073e@oth-regensburg.de>
Date: Thu, 1 Feb 2024 12:15:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problem installing Jailhouse on ubuntu VM running on X86
Content-Language: en-US
To: Syed Aftab Rashid <saftab.rashid@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <a2cf0e4d-925d-4d67-b619-c07c8bb42657n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <a2cf0e4d-925d-4d67-b619-c07c8bb42657n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=twrIod2y;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:d:c301:acdc:1979:2:f4 as permitted sender)
 smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 01/02/2024 11:32, Syed Aftab Rashid wrote:
> Hi all,
> 
> I am trying to install Jailhouse on a Ubuntu VM running using VMware 
> inside a Windows 10 host system. I am following the instruction provided 
> here

Don't do it. Use Qemu/KVM with Linux as host, as described in the 
README. For building your environment, you can use jailhouse-images.

Thanks,
   Ralf

> 
> GitHub - siemens/jailhouse: Linux-based partitioning hypervisor 
> <https://github.com/siemens/jailhouse>
> 
> However, I am getting the following error when I run "make" in the 
> jailhouse folder.
> 
> ERROR: modpost: "ioremap_page_range" 
> [/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
> ERROR: modpost: "__get_vm_area_caller" 
> [/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
> ERROR: modpost: "lapic_timer_period" 
> [/home/ubuntu/jailhouse/driver/jailhouse.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:144: 
> /home/ubuntu/jailhouse/Module.symvers] Error 1
> make[1]: *** [Makefile:1989: modpost] Error 2
> make: *** [Makefile:40: modules] Error 2
> 
> I have modified the /etc/default/grub as follows
> 
> GRUB_DEFAULT=0
> GRUB_TIMEOUT_STYLE=hidden
> GRUB_TIMEOUT=0
> GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
> GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
> GRUB_CMDLINE_LINUX_DEFAULT="memmap=82M\\\$0x3a000000"
> GRUB_CMDLINE_LINUX="intel_iommu=off"
> GRUB_CMDLINE_LINUX="find_preseed=/preseed.cfg auto noprompt 
> priority=critical l
> 
> What am I missing here. Unfortunately, I am a bit new to this so I might 
> be making a basic mistake. However, I couldn't find any proper 
> installation guide.
> 
> Any help in this regard is much appreciated.
> 
> Thank you
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/a2cf0e4d-925d-4d67-b619-c07c8bb42657n%40googlegroups.com <https://groups.google.com/d/msgid/jailhouse-dev/a2cf0e4d-925d-4d67-b619-c07c8bb42657n%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/338fb8b9-c069-42c7-a0b3-48dfc5bb073e%40oth-regensburg.de.
