Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBGNOS74AKGQEDAF57XQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 576AA218A17
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jul 2020 16:24:26 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id k10sf34953430lfk.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jul 2020 07:24:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594218266; cv=pass;
        d=google.com; s=arc-20160816;
        b=qNO4XfS3JiUrYeaudTkfKnWUWXSx9+aGWf1lhV6GYnkBo1REtI7KscP6KMjDoKs6Dc
         hyrskR9aMKvTb33lRO/naD35YHZaq5wU1KdpLc+Y1rvElNKTmO65zkRJGyEBi3ndxRXR
         Ba9XcyjBQCGoRpEWNZAz/eJsmqkSli3Us5IoqLOju6htZZxfTCb2Pny427VLyIUCBi+I
         Sb1b0a8so+nzB24H4YBSnVHFhBEX2e05Iwh+PFacYMw1ebg1cQwEM8i89+HbbEKoJUh0
         KWN2D+Y1Yd63UWWBHx65/HIqFLnh4xYjO0ElkPf6ZATw6xL5w/9Bq8ahyWQVaVVBkPip
         CNGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=4T7EFEYTn5UNckodXo4oorBxm7DVP/CjiBZmHTyXMJM=;
        b=vQa9HD+4MuHjRA7DNb6W8CcmOHaf8LijI3OmkORriyMWx6JA0rKTcqhSilzYxGkFvR
         gaaTgoCftZiIT4F39H9CgbfivsqiDWYmJ4SFp4M6wqfa1l0CNxmRu6OYfnDqmle2PphC
         OJT6aIILJIAjFokuuB6LZ9/tuz3hWMkaLXUzurOj+ZpzPWAArsRq4f099iYPk4ceF2Rg
         KfniFFyxCsxjH+zdbPBP1qyAR2qvXJgV8PHeOrV8yK1+i0fv7EW04CwXaO0ZRpiscO5r
         xwriNFfo09AlA6ICeOrzBPW+Jgvcb1BOeL6fcR3qDVLsOWzryJvnprNawCs5mKnspEk0
         qB1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4T7EFEYTn5UNckodXo4oorBxm7DVP/CjiBZmHTyXMJM=;
        b=gmeFrSPk9m94yWkGajPEGxhFt1gM7pJf/rJz9vYY56T6ANM7XwQsdo9Z32P9c0zFw1
         4grtUzMtKMpZuBhAr+VwxriBTPadKp+xbTemHCe3ikLN38s5g6i7s3UixXL/eHiIk62D
         who0mrd7NQpHokvntibKTtIo6m6Bx7VzJVrAngNxWyZVvqRp9+AhtTYNQGZIUoAHZbHk
         0dlTEF8DdkaJLlEaNcfp8KzKh4e3YEBx/K5Q3HGldLFvWcNKfLQoe3z330JRcXNa9Yml
         ULQQiUX2Zf0PvOLRu2KpGJMG/cyL4I1S8debyu00O7goHJPRj7UR7j6yTaZH3Fb5K1o3
         o6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4T7EFEYTn5UNckodXo4oorBxm7DVP/CjiBZmHTyXMJM=;
        b=s0iKk5ibtorNL1ivKOXFbEcRcnKC/YvVLxn/8drJzurqxCveeGmHFSDyUF8xxt/Mo8
         XGNXvbxHoVe1gIfOa+4rVhjkxPXQNHgHWL/FjLaZBgbUpWa+yLoh1UwrNr7Rox6DdCdp
         WIYv79ED+e96ihkSTL6rRVtcDbx77EB6jNepBufRSVi6taUUcVVExmVCZvnwquT2ZpUW
         h+Q1R61OlhWiNUkGR39MKz2/a/ktw1jju/xAc0VB/+/UMgc14qMveAUSFWLLacTpV7NL
         qVY9rNnwsVizwF1Dg5nprjqYmIrvnclESpXeplCuh94enwbWkwHbeh4FOjzBjU9goI55
         K8WA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Lb/sd4S8q53k2CNKL+3ZIxUxIdD7+QdsmaYoFCOGCC5bIyKaQ
	me5iPgxywz/iJIupCkJT944=
X-Google-Smtp-Source: ABdhPJxob1/WYKc6x85tyesCgj8O/41bnYFNENR8zIsvxB/6jb3qoYT3HZxRNEUaUfkvGmFbXw42QQ==
X-Received: by 2002:ac2:5593:: with SMTP id v19mr36241719lfg.43.1594218265825;
        Wed, 08 Jul 2020 07:24:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9809:: with SMTP id a9ls494318ljj.2.gmail; Wed, 08 Jul
 2020 07:24:25 -0700 (PDT)
X-Received: by 2002:a2e:b4ed:: with SMTP id s13mr18307954ljm.296.1594218265183;
        Wed, 08 Jul 2020 07:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594218265; cv=none;
        d=google.com; s=arc-20160816;
        b=I5uZB6Y2INgAjr1sel6W4qo2q+GYP/O70rVGxffJ+S/gsgzA/MeNLriBRI9fTaLUv3
         UsSY4Sd9AqAqum5vdcY6B4tirfaQFoZ41yc+Ruk+zP8NtAQYugriNhr/ScHgLTdOm8m2
         36ht0AHJYNiWjuvd7fWRDWiwXJLcF+zyzx6FnQ03guGu/Hpiy+DkHYWXTzLLlvL2FQqN
         UW8NPICG9/2aGXnbIRFli9mE2rkkrpDzVZT4mQrrKrldxJAZTVvVIhDQ7U4d3cMZmm0o
         sA2hHVaAexplJ7LJIo+dJ0kL7Wgp6pZqC7T2HfufV3GmWxjWIvpsf83ro5CmcKdbaGCu
         zXmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=RSSDA/LGQMkW7rCwaK/eTq3T0u8ej447lnE2yZFeiL8=;
        b=Armfjoqk68jfZy7P2llNey5sYUvAI7MAm07BToIxWogdy4hIn7j6/jufr6sl/BSl+Y
         3PWeGkSEK5ud26PqxcqeXNh+dzzTKhHWwkNQzJQDEyzv9CfiGZI7LrLvGBszpa/orFXD
         s68pYQn+lnWPj6UhntUeACWjxMgMJWVk/mALV7axcKy+kjMHIdxatvL+iaHTDFnUVNOP
         VMQRmtv4CtAXXHKrHdKGhJBRoMEBzsyLYchdaEeQDamqxX+ZCvxPOH/3lhXRvm8TFPeK
         BJc7xOcPRGXSDTN3hKp3lBRcR4treNPs4b60f7Oo8TTEcBNv68j3JcwpK3HVoi1/IN6y
         B70g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k9si3120ljj.5.2020.07.08.07.24.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2020 07:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 068EONwc012243
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jul 2020 16:24:24 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.28.133])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 068EONu7014984;
	Wed, 8 Jul 2020 16:24:23 +0200
Date: Wed, 8 Jul 2020 16:24:21 +0200
From: Henning Schild <henning.schild@siemens.com>
To: Yang Chung Fan <sonic.tw.tp@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: License of custom cell configs
Message-ID: <20200708162421.56e41496@md1za8fc.ad001.siemens.net>
In-Reply-To: <CAKa8VzgwFp=LZ=riydg=enHWPX8cHVJhE_4ZPVwf-unvMRLVCg@mail.gmail.com>
References: <d88a71e3-1269-42f6-93d4-6f66658e5da6o@googlegroups.com>
	<20200708152531.25e804b0@md1za8fc.ad001.siemens.net>
	<CAKa8VzgwFp=LZ=riydg=enHWPX8cHVJhE_4ZPVwf-unvMRLVCg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

On Wed, 8 Jul 2020 22:35:58 +0900
Yang Chung Fan <sonic.tw.tp@gmail.com> wrote:

> Hi,
> 
> Thank you for your quick response.
> 
> I think BSD is good for our situation.
> I will stick to that.
> 
> A follow up question,
> I am porting the linux ivshmem_net driver to an RTOS and want to
> distribute it with the RTOS source.
> At the end of the day, I want to have it PRed and included in
> upstream. However as the ivshmem_net linux driver is licensed as GPL
> v2 and the RTOS is Apache v2. They don't get along too well.

I am not sure a re-licensing is possible or feasible here. The driver
is a Linux driver and therefore needs to be GPL. Adding a second
license would probably require a sort of split, separating a
dual-license core from an OS-glue. Making that split generic and
maintaining the driver for multiple OSs would be hard.

In fact i wrote several such drivers for our products, turns our that
the re-usable "core" is not that big. And different coding style,
device driver frameworks, or network-stacks reduce the reuse potential
further.

While reuse sounds good, the pragmatic answer seems to be to
fully rewrite the driver for every new OS. You should get in touch with
that project early, maybe they already have something ...

regards,
Henning

> I would kindly ask that is there any possibility to have a more
> permissive license on that driver, just like those in the inmate
> library?
> 
> BR,
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200708162421.56e41496%40md1za8fc.ad001.siemens.net.
