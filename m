Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GK3TUQKGQE4VQPHKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC871B6A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 17:19:12 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id e20sf9392641ljk.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Jul 2019 08:19:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563895152; cv=pass;
        d=google.com; s=arc-20160816;
        b=rDOzwbPHMLP/h0DjC7SYa9OgU5mA1yHd6gmBDsqrXcQshRRl7Bz9lqxB8Hr7i/RyLe
         P46LjxSpvTUvc2HlkBXyMvtbsV+FLDIBc5kT5ZcLTAkXDqORCu9VCs4oA5N/nzLNaATA
         X8xxk5nybHCeQ5BnGKy6qxxycAeg5rud/MevEKdReZrv286AGhYK62R5kkaiMCfNPS83
         Qf5MVNwTnFVBKqPJmY1wu/nVOTpPJNYGZLkm4088Lb6or+1Qa1vfC3wuJWaUUp0o7AUb
         7+ZqYVaIsi3vgCuT6xglnhRD7oDaOye/Y7Ueosy+O2ZCPaFvm0kasaTZLuVPqTYGl8vC
         OYPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=BIeLsTZxG8HDbZUfhw+K3UqsNqKwDJk6vdf5Ms76Bzw=;
        b=tfp32qKndaTTt5p4Kl8CmJUXa4zt+Cvs1fAA1MXCns0LuA3Tv1ZhRSoQYfKXeHbOrb
         xBGlBS/QykJbxx1X9+AkRGHy6siV7ujIZTpL343anb3pdgnVV0faW3n89BhYGlkrA3P4
         Hhl0hsW0oD4j04hc4HzsxzCJ3aeWJUYKCtQZrWRxumZyU1yz+Lht1zrdx45j3rxSrSgG
         JxT4SD1W75iNM49B2nQT9C4zk0MlpeoN3v3XfUjrhsLPOg8aRnPL+Cc/+51YhIzkUWCD
         Ya2FwyqV6bdvwopIox1oN0vy3dPzEVQyq6ZKLhAm9oPIQNVLnFOik10zoeVW4eQZMyrF
         Vg9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BIeLsTZxG8HDbZUfhw+K3UqsNqKwDJk6vdf5Ms76Bzw=;
        b=j1rp8MI7Eq0Zj41ASqidfD39Xt1J6d3Prs/KgALYe2+9UY+wy28IZVcxE41akGyAmK
         BsQxLBMPM7gpkvwszfuMIj9Me/aZgb2xY0cXZnR5NJmm2ngDvp0lB72jB2k02SRRwRr7
         CkWNcjC71R19/powV37OfagLqnFGq9FXq+oPsnqryQpsTY7ZEbpca24vZib9aN4WqOe/
         aSwddUjsaeqPfRBdAMhf2uEmr3AOIHuwUYmSZr8ZSwI8/OlOShC6/9l/FTHfn5bvQpo4
         SbG+VvnmT98f1YF4xEuc26S2uQRY7piCLLcJImsaUn+6UBhbJ3KvvTZRzqOhCeGSD71J
         OJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BIeLsTZxG8HDbZUfhw+K3UqsNqKwDJk6vdf5Ms76Bzw=;
        b=THG8vF6BKqCIdMkYyzNWk0SaU0i2DFfOfNVrXp5rczY19eFLCv+LdlmyZ3nyC+z4QX
         ggiiF3SYKiJ8uApz8xtgXR2jFTI98vVQLd414SHbLjXO8aJJaAZ5boyvAKXQX/FGPHGx
         rbFkqk3wA+kXqKBPv3AUm51An0bCvDWVVt9Rt/7RQ94vr5+Smkb1u3l2TzjXwOvzvdNQ
         SWeNDOJyXS7nsPtxlTgORtIGnLqIrIZlBx7P5YivRIMhiVysiCZ1RGmFsyHerk1NxC8r
         r64w5L7MpNMv3cdCdNVih3QtPJ8wgTBmdHvbL0bHpVTq/i2jFnkjv1PGGyrdiHV1N8CB
         1vZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXXdoLYhn/arCsXIbOb2HfH1sjMOhOpdpw7Yw0dwUjBnAvpz+gf
	3NnapQTfgNRFHrpOP1AsT4I=
X-Google-Smtp-Source: APXvYqxZMolENHGw2cPTDAxYyChrkHoRobUFUOopMnNGgFclq83Mzj8EbRZxf8F1WtNDMsrmQp3Z8Q==
X-Received: by 2002:ac2:465e:: with SMTP id s30mr21781252lfo.19.1563895152136;
        Tue, 23 Jul 2019 08:19:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9153:: with SMTP id q19ls4927040ljg.13.gmail; Tue, 23
 Jul 2019 08:19:10 -0700 (PDT)
X-Received: by 2002:a2e:988b:: with SMTP id b11mr39444269ljj.110.1563895150890;
        Tue, 23 Jul 2019 08:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563895150; cv=none;
        d=google.com; s=arc-20160816;
        b=Uag7EM01C4a26MtaffIY4aXcEjvWpmhzPg321FOAvhOpoGPYek1BIxocgMzzLns53+
         xoLlpFj4VOR+uEd8u/doSMT907TB36ij78u9axPm6RmM/OEeTSySBmDw0eYV1zJGfpNy
         HzNr6+qJ1n67hrKci4f4ak22l4LRvcLWazvcxtfYLURo+ABFj7od2airL9NrE3yOzMmr
         Q6Sgazg8qd2//Vbd39ndRmwalarlMh8G1LV+WHcK/Yp1pZ7uD/5qYIvazkGq2JVmYY4V
         T/3wr9x2Xa2R/NN3LF1q6mrnAq2VlFLbIwLuD2AYSmrdztJJVetIZBtpdB+WAkULWGz1
         eXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Jenk5tuZipOYFPm3/BUz0eZpm4gPRapby4HDuI5yv0U=;
        b=ctABJX4Sui3fxnXZzSbeSV+YUxIQCSRv+Oai5SbhawCgQ2cvRdmEfNNJhwFbS422SC
         6BaxSy6LwFjmjLAtus/dVx9M4xliwfUuWDNHxAYxU+Z0GjtXViPWB4JKz8PqjW+cHcxe
         5HoXPcYoeXNQUPEICxwQsaGQ1FtFia+rBOkjAYs0YPTp1dEKmsvyoa9+XlHRN+D4RDiQ
         sPnb1YsQA9qp8HkPVJFQOI/ZhUufnl1za88waQ8y9tsStJQWE1xKDI+t/rSmPgC0cRem
         JZ2RgNcIjIGkbOhNYGqURoHlEvbMrL1i+0PfWe/zqZpk7UhoV6vS+E1C+zIUYc3RdqNL
         07Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id b8si1920061lfp.3.2019.07.23.08.19.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 08:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x6NFJAUF015929
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2019 17:19:10 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6NFJ9Vt028427;
	Tue, 23 Jul 2019 17:19:09 +0200
Subject: Re: Jailhouse and PCI UARTs pt.2
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3d158812-b502-3641-f509-2508560aa51f@siemens.com>
Date: Tue, 23 Jul 2019 17:19:09 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <80b316b3-a6e4-35be-7cc0-578f1ac685de@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
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

On 23.07.19 16:50, Ralf Ramsauer wrote:
> Hi,
> 
> I start a new thread, as this is now became another issue. Still working
> on getting a RS232 PCIe card running in a non-root Linux cell.
> 
> The good news: basically, it works. I can send and receive data via MSI
> ints.
> 
> serial 0000:17:00.0: enabling device (0400 -> 0403)
> querying PCI -> IRQ mapping bus:23, slot:0, pin:0.
> serial 0000:17:00.0: can't find IRQ for PCI INT A; probably buggy MP table
> 0000:17:00.0: ttyS2 at I/O 0x4008 (irq = 24, base_baud = 115200) is a
> ST16650V2
> 
> I still see the 'buggy MP' error, but it can be ignored as the driver
> will eventually use MSI.

Yes. There is no MP table with Linux running as secondary Jailhouse guest. Thus,
the driver can't get anything set up for its legacy INTx.

> 
> 
> Two bad news: Linux's 8250 driver needs patching. At least we need some
> parameter like 8250.platform=disable to disable the probing for platform
> uarts. Why?
> 
> ATM, we must specify 8250.nr_uarts. Otherwise the kernel will touch
> restricted ports. It does touch those ports, as it lacks ACPI platform
> information and assumes 'any' platform UART is present.

Yes, nr_uarts is the patch-free approach for now. I once had a hack that
propagated the information "this is Jailhouse, you may not find platform UARTs"
to the driver. But that was a hack, so I didn't propose that upstream along with
the other x86 changes. Plus, there are cases where we do want to use a platform
uart in the non-root cell.

> 
> I.e.:
>   8250.nr_uarts=1 only touches 0x3f8
>   8250.nr_uarts=2 touches 0x3f8 and 0x2f8
>   8250.nr_uarts=3 touches 0x3f8, 0x2f8, 0x3e9 (?)
> 
> In addition to that I have a PCI device. And Linux won't probe it until
> it probed all other PIO ports. If I specify 8250.nr_uarts=1 (as I do
> want to restrict access to 0x2f8), it will never probe the PCI device.
> 
> So at the moment, the hack is to set 8250.nr_uarts=4 and permit access
> to all ports. Yikes. At least I now know that the PCI device basically
> works, but still, this needs to be patched.
> 

OK, that was probably not yet addressed. We once had a setup with UARTs on a PCI
card, but that machine also had no platform UARTs IIRC.

If there no other way to tell Linux the number of platform UARTs, we will have
to introduce one, for the sake of this use case already.

> 
> Second thing: Sending/receiving works fine, but I still get VT-d fault
> events. Such like:
> 
> VT-d fault event reported by IOMMU 0:
>  Source Identifier (bus:dev.func): 17:00.0
>  Fault Reason: 0x22 Fault Info: 8e000000000 Type 0
> 
> ... We don't have IR-PCI-MSI in non-root cells, right? So where does
> this fault come from?

We do not have guest-visible IR in non-root cells, right. We do have IR in place
for them, though. And something is misconfigured here. It says that the device
tried to send an interrupt although there was no programming for that in the IR
table at index 0x8e.

> 
> Note that before handing over the device to the non-root cell, the root
> cell didn't load the driver for the device, so it should be handed over
> unitialised.

Check what the cell programs into the MSI capability of the device and how that
propagates in Jailhouse. Sorry, once again this path :).

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3d158812-b502-3641-f509-2508560aa51f%40siemens.com.
