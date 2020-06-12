Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBEHWRX3QKGQEUDEOZOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0201F7829
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 14:54:42 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id m14sf3867994wrj.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 05:54:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591966481; cv=pass;
        d=google.com; s=arc-20160816;
        b=gDxQuLj/tDYK7IsHNCYbC6cHvPLe9agPmdearnaEPILtJKPOKoTWs2NA8blherVV0b
         RmSaMUx0qvw7ZeOwmXmNNz7/SHzS9/yjfxCCml7QYUcEysdEDFaLLn05zMvetk4/+fgq
         9BxNY/gN18Bkv2EdOFy0nFoVAt0a2P0mDlqc3wm64m7nlAEl7ml6E5Vzs75KL/B2yCRy
         8x4KBeXxDIEOBhUT0Wd05fMl1kH/6JvJJzoFbrpIaVCrGGCiyrO0BBwaqpPF63sygO+s
         54jodru+3YnD736iAugoVa5d4I7MLFMRDGG0wqTpXloMqYuJttCUMltOSvU3r+1HjsAU
         MtYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=RtzF41oP4BSsLLpaTrSAWYIdMzMcOqOq1QXbTAbsJOQ=;
        b=w3BjtBaudiqRwpnFIaz1L8Q54iMWZXHQqJz1lp+UvZdawYZVEFgGY9A9X0g9cn03d+
         PM1pXmpKd1pRppxV5xeDBlZf4Hyu9nZ8RzMVnkaAg/fNTbt7KGblDdEbCgFUU5a5vC0V
         +7z4evmcf5o4gSeNTQV3JB+lhb43vTZxi+KZUgF6VG6ncZXoUWNqbjBIXD7OZ4raEGA5
         Q0I+GNfvZZ3YvWBNhT9UhWR5NxKT5CzVvOX7ID/WlUClWME7ewx/CiAqDexiFoxin/I6
         ZHv5fO1hzpS8Va3c4nftu/kN/M3f8Hi4BDMJH1cg1bop4cP7ofK/FiqiKyDiga3RdeP8
         mI3w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RtzF41oP4BSsLLpaTrSAWYIdMzMcOqOq1QXbTAbsJOQ=;
        b=GC5a/fcTG3crmzAHRK0yq7qJ6zxrKk7ZL7UhpU23K3EM0XBUyf5y4MxQBNr5vCZ9f4
         1A8JJrgXSnC7VSfSAqiXNolzUtSMix1lM1A39xipvh6y5Q0xjhn1oSEYCPBGKrV7BMjb
         nfZuMAXmxpvDU9pzFe/icv7ooFvLnuZ4Ki48koHcP5DhFByoAIRtR/wBtEFR8p5Comgy
         FAAJG61zTSH2cqh6Bh5xSUMPzeEVTqBAe2wC+h5YBVF/GAuyqjXMH1FgzR13PTDXyekE
         fJaoc7kYK+nqEH4GGgsVnPSn919tAKkiQX9bbQq6k7wjOxXnczgRkqQixfd9GS+y5wx/
         sK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RtzF41oP4BSsLLpaTrSAWYIdMzMcOqOq1QXbTAbsJOQ=;
        b=Wyw4Dq0EeQxGWTkOy+GR6wKOIYOtEeazJDeF2+yM10G9hzd019NahsBmE2T8mvHFvS
         iRlQNWcAiEjf4mHjG/jW7qzLh6mEfDHw6CFJvCHv7Dt3c2IxilJlo/F+htILciF9kLoA
         xPAnxB00akb2Zrh65RM3lP5rbpEUVSITP13ZRVx/RD54DpR6HnmyjMtkiXd5I1jZpUP9
         bVYQ7x9uXIrxYenf03Qvi30ouwNcI8jmkJsXc/7vbjg6bG6vQDxrfHedqKYNrm4hCmVN
         s9QzqjdrORFw5FB0qYJMXj67u22WCcjr+ujbavI/GS+hAygvorLbmhSJHVd8oooGL8aX
         r6VA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533KBxB7jIFjkrLffyOkSIf1EsqMZOnW79NivpT9bxEpAqoG8lyp
	WqxhujWlUGhQ7ljVK/dXhuQ=
X-Google-Smtp-Source: ABdhPJybC64e6vImU3ULzS6z7hoUByaYVgXGPk1PK0b7TFXZRpReuP+2cqqU/fNiXmKCFKDmk2go0Q==
X-Received: by 2002:a1c:6155:: with SMTP id v82mr13520029wmb.25.1591966480875;
        Fri, 12 Jun 2020 05:54:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:1d53:: with SMTP id d80ls2636266wmd.3.canary-gmail; Fri,
 12 Jun 2020 05:54:40 -0700 (PDT)
X-Received: by 2002:a7b:c08e:: with SMTP id r14mr13802489wmh.78.1591966480060;
        Fri, 12 Jun 2020 05:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591966480; cv=none;
        d=google.com; s=arc-20160816;
        b=j2mwbjDBUmpzEAAZbtasDWc2hmx8mYHKrTyFIVL0dY8QLxAFLwx8wbddrvKrq6+LYI
         qWBmTSuvTqdLJ1b8yXByqbMpg2Ll4iymu5ez9rYbwOYYjKs58LgHVW9slGCI4dbNAj/L
         VO3jNPHwNaw/6afAtHd2GCg5T1ssKbOTc5TrEx5HQX2zNTjrxBscFFvl2Bp7taNzN/Xr
         JMX+mCBfnXo5I17hKqRF6WNg8UPfYtd1CskixtctZlYwK53dct83w0yULWdzbhgLoziu
         ydUAhTZnJ+R/jZydkIMrPvjIOCxpJyXfdYyZwEbHsl8FQjGkkcVQ/0NbacsT9BjxCsLc
         dX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=piwOvMoaMY/y6LZ396teAB0zlPJ8hd9t1HYPE4lWopY=;
        b=yf2QZR7JDDCaXL0c6IWjkIU0aIoEC/5Oww9nT1D4Yht4Zic82Oq4gLe9nmQ7pbkbSe
         wcj3uwzLdf10PckC17pws042h1UYBg69B6dXo7Hbhp6odeDL4V/Kt1Y70t531lrL4Uo7
         84pkZmZTBWeFbyz6BDmcixYgy8l5rzjkuny6QFgSfTLbONDgTYSRshZJkF3SmCegWfxr
         5Iwi5zV+gFI+MdhmUd9In96wpRlPxZH3JJ3LKZEGk7jd0zZVjgvV6Qv/fy5qhRqIvojg
         bZFc/fSOCpVsyE1VkiiBtm/qI22BIU6LfI+4F4RcDbkcuQ7GrnRuFs08NrkJurYG+1fF
         3SDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i13si307991wrq.1.2020.06.12.05.54.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jun 2020 05:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05CCsdZe016405
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Jun 2020 14:54:39 +0200
Received: from [167.87.11.220] ([167.87.11.220])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05CCscNC026281;
	Fri, 12 Jun 2020 14:54:38 +0200
Subject: Re: Reboot root cell
To: Pratik Patil <prtptl.smilingcorpse@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com>
 <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
 <564a7919-ca75-46d6-b69e-692c97c8c9fao@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5f5ca0fd-d3a2-6cdb-966d-37a2db81e70a@siemens.com>
Date: Fri, 12 Jun 2020 14:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <564a7919-ca75-46d6-b69e-692c97c8c9fao@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 12.06.20 11:08, Pratik Patil wrote:
> Thank you Jan for your reply.
> If I skip the hardware initialization step and reboot using kexec system =
call, it should work. As per my understanding, inmates can run without Jail=
house. Or is it the case that jailhouse kernel module has to be always load=
ed for the non-root cells to run?
>=20

Conceptually, yes. You would have to boot into a non-root configuration
this way. That may work already on arm/arm64 by providing a reduced
device tree (like we do for non-root cells already). x86 is different,
though, because we are booting non-root there. We do that with the help
of a stub loader that provides required information in bootparam
structures. Would likely requiring some patching, somewhere.

Then next challange would be that the root cell would then lose the
information about the active configuration - the jailhouse driver would
no longer be usable. Somehow, this has to be addressed as well for
pre-Linux partitioning as it is currently being considered [1].

Jan

[1]
https://groups.google.com/d/msgid/jailhouse-dev/20200305093950.848-1-peng.f=
an%40nxp.com

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5f5ca0fd-d3a2-6cdb-966d-37a2db81e70a%40siemens.com.
