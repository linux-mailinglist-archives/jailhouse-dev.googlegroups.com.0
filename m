Return-Path: <jailhouse-dev+bncBCP4ZTXNRIFBBFO65XWAKGQEP5CAAQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4ECE9FA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 19:00:06 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id t13sf9426947edr.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 10:00:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570467605; cv=pass;
        d=google.com; s=arc-20160816;
        b=wXPfUe0kES9vxAvzQRb7ZAILcLd0DYZhbEKkxKuQq26EYwW5KkxHs3XLUG1a5kcbEa
         2H+2nskqYgTvF6A3OfimUPLlm5J0Tvj6ShGd7eW+N68JOQIQA8gmfoBGJbT/4VpxdZUY
         N28Zxw3edi5Ri5QX73YTNX5CpMsQ5D9o0pvPrzjUGwZtSzP6lQ6qxV/ixqfTXPLgcz0W
         uTw9v4SWAfHNNxV0oAkgl9kHhvx8Iuuc8MKVdDOkH+WTmvJN2vWhSWznCoEj+TnqnwBj
         IofEOrXFGN7ZSYA7eLLl2/+IOjjQoR1o+nZsrjUbqXW/2NUDfo+7GKOulxasH55G0OUz
         nUKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:sender:dkim-signature;
        bh=nT9kkXesz8wh3urm49TzwStg1i81TqgYbGf9yhX9wFM=;
        b=XbtzDbualRZwnQ2BRojvH9HBA9Opxix47g1j7axCk7xDMawZlDZWuKkbZVA5FnRRk0
         Wwflsvh83zV+af5DFz4j/VqSqC0iYHfUoBapjydG1B8h6m8sRX9e95Y/XN53vapCdmbg
         5Km/BmAahQdIMi4Vms8kQf1Gnr0xe8KLLeybDK7SY4rFL6Rje21d5hVbnX6LS8vKqMOw
         00vDUu7Qvwy/1JS3ExRyNp+yZDNj0+jsuJ1MSHFLaN69sjKXLMdpBsOfMNl6FaU3+wkv
         +HvAVsVAVt1fuyGL1WsGIPTiMSMNFEMJCdo/P+lLH50nJxFcSb7vSB5QT2BsyutPE5OY
         l6GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=qlD40uM6;
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=nT9kkXesz8wh3urm49TzwStg1i81TqgYbGf9yhX9wFM=;
        b=WDxNyZeYwjhqI+TfFwiEi04yCKXUVOYysp39j3ITJaLBpmawHOGQieCYNroiMRDs6p
         EJ1NUR2Rgt/92LvZyk08bF8eBf5LyiNPJ+DVYtSRpwvQXdHDj9c2XkL5ySjsl/HEUcxh
         k/Tpks4wBioxME74CCIxR3ZEH14UlyeyHW7FsmGA9WTn4OhZV8dfNbTs/Uhr6FeZQsUd
         eS/Y8RHdWWyof56tu6VGe7nZEafWQwHkZhLSY1eF34Hlystz9otFOkaWoKBLHZ3pI9Dw
         NRwihFH45iqso7bq0on9svEVIJFDj0z2RWHyx8xCi+0FssgzYqAjt0nBTFAgHcw+sw8c
         rNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=nT9kkXesz8wh3urm49TzwStg1i81TqgYbGf9yhX9wFM=;
        b=CQWlLLGNM/bpiMhLwdVrdcgecUUvJaO8McJlYbO5uGdEsznDCOF3vh1lUdku0QPOfB
         CLl6kAYEerBIAgVXydxGxU54UzmktnU9AqHrPSCFe7zR7Ji/I5pRcvWZKFtTmjobU3mW
         GnZFkTla9WQRQgUEgEX35keKjIRFAskZi9I/nbOd4FF6tDunU8HN9fXkCei/W2n4PE5B
         RNfTebaQ+ZPmC6WhtJkZcpI34RqeTqzzFb/681sdKVRRP9STied9nWgy4YkdpVOjT52N
         6shnYx3WpwU/D98z5ypqyBo6GA1GR/v78R54fll6v0aCGG2vLA0OPgHjOta9nlDBzgSn
         oSoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXrLKK9XyTpOGn104n5J5A9hbXJrqJrOOabxiZ5yg+uz+fVeYkD
	DhS92XgtIQrqbZ6XRYkc8QQ=
X-Google-Smtp-Source: APXvYqy0IJeQo5FQkUS/ML4B0D03wmo1Ky7JFMWaKvJEkbXS2APGUpWz1hlAzXL6udAa1P9dCaHa+Q==
X-Received: by 2002:a17:906:b804:: with SMTP id dv4mr24530326ejb.243.1570467605820;
        Mon, 07 Oct 2019 10:00:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d144:: with SMTP id br4ls149766ejb.11.gmail; Mon, 07
 Oct 2019 10:00:04 -0700 (PDT)
X-Received: by 2002:a17:906:a01:: with SMTP id w1mr24660126ejf.240.1570467604906;
        Mon, 07 Oct 2019 10:00:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570467604; cv=none;
        d=google.com; s=arc-20160816;
        b=SaO301KoaiIfWtyupWw1Iik1NvYxW/oFgTnSgBttp33dbHjyFMyuDTbRT8IvJKpH95
         Ru1hfFDyD5Co4gH4Tp5ZqRpFIiAaUhb9Bj7S0nUZpOLSG2hKk4v0iq4d6+lqUFb4zKEj
         Xzryh+mjDoI5deEpoE7xSNnWmDf2NG5GA2Q8Na0ZcPXS1f+yTYz/nsy6SmwJncy+HP4E
         yHB1TSQzIkchrnWO4/umyPoe8SZeAsXQRNYyApCHaLEX0XsfI2synudxIWVEj3J0ch3c
         ecp8ihLsLwI7EmnkBo7wnsXG2HH8LBMTSkF8MIm2va8Rqg1bSg62yViOKI/yJ/EVMwAC
         LY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=ZvNLEWaQDcZ6eL061D1WLQ0GhGCmCN49SVaTp9ErjJ4=;
        b=Wn8Vff1tZAr4dZgoFK7LOna5zcqN6UHP6gNKZBrE1OPbElZLJY/PjN0P4oogSYinGc
         Fsc2AgtR/VjV3erjBRUKbPwnCdEaArB0hnLbo5psyQMjX/SA7zRrbFsvc8/yziT/z4Gg
         tyzoIYVLiFlGoLt5UDZmVdPE2ibBMqsx/tS2H+DIXpI59g5ukdVf1y2iGnuyH1p31LU4
         dNHGDyvb/H7yYmWP9agU06UDhlqzmF1aIOdN84yc85kS4sDKHvAsFb/F5PHJj7srDDwP
         IphUOnHvwTRBijhZZlHM/l7rWw0fUstweZsMiUL7lOXDY/0dWahDjsk1wvUhg7bdq6fP
         Zh9g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@alien8.de header.s=dkim header.b=qlD40uM6;
       spf=pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) smtp.mailfrom=bp@alien8.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=alien8.de
Received: from mail.skyhub.de (mail.skyhub.de. [2a01:4f8:190:11c2::b:1457])
        by gmr-mx.google.com with ESMTPS id c31si1004150edb.0.2019.10.07.10.00.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 10:00:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as permitted sender) client-ip=2a01:4f8:190:11c2::b:1457;
Received: from zn.tnic (p200300EC2F06420085D86D94306C6599.dip0.t-ipconnect.de [IPv6:2003:ec:2f06:4200:85d8:6d94:306c:6599])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 507C01EC02C1;
	Mon,  7 Oct 2019 19:00:04 +0200 (CEST)
Date: Mon, 7 Oct 2019 18:59:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jan Kiszka <jan.kiszka@siemens.com>, x86@kernel.org,
	jailhouse-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v5 2/2] x86/jailhouse: Only enable platform UARTs if
 available
Message-ID: <20191007165958.GE24289@zn.tnic>
References: <20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de>
 <20191007123819.161432-3-ralf.ramsauer@oth-regensburg.de>
 <20191007162636.GD24289@zn.tnic>
 <85502467-d13b-084e-cdb8-d891178e97d8@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <85502467-d13b-084e-cdb8-d891178e97d8@oth-regensburg.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Original-Sender: bp@alien8.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@alien8.de header.s=dkim header.b=qlD40uM6;       spf=pass
 (google.com: domain of bp@alien8.de designates 2a01:4f8:190:11c2::b:1457 as
 permitted sender) smtp.mailfrom=bp@alien8.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=alien8.de
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

On Mon, Oct 07, 2019 at 06:44:39PM +0200, Ralf Ramsauer wrote:
> Yep, jailhouse_serial_fixup can become __init, I didn't see that, but
> you're right, thanks. I'm curious, how did you find that?

CONFIG_SECTION_MISMATCH_WARN_ONLY=y

If that it off, it fails the build even:

WARNING: vmlinux.o(.text+0x4fdb0): Section mismatch in reference from the function jailhouse_serial_fixup() to the variable .init.data:can_use_brk_pgt
The function jailhouse_serial_fixup() references
the variable __initdata can_use_brk_pgt.
This is often because jailhouse_serial_fixup lacks a __initdata 
annotation or the annotation of can_use_brk_pgt is wrong.

FATAL: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[1]: *** [scripts/Makefile.modpost:66: __modpost] Error 1
make: *** [Makefile:1074: vmlinux] Error 2

Apparently we did that with:

47490ec141b9 ("modpost: Add flag -E for making section mismatches fatal")

> "We" didn't notice yet. :-)

LOL.

> BTW, we refers to the Jailhouse folks, but I will rewrite that.

Thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191007165958.GE24289%40zn.tnic.
