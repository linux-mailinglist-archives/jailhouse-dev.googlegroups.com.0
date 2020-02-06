Return-Path: <jailhouse-dev+bncBCDJXM4674ERBUGL6HYQKGQETHGKXHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id C85F3154BC0
	for <lists+jailhouse-dev@lfdr.de>; Thu,  6 Feb 2020 20:15:29 +0100 (CET)
Received: by mail-ot1-x33c.google.com with SMTP id 75sf3786674otc.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Feb 2020 11:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aSbmDYbQXdQPxizoSG6FnTQ35o8EjiHniz6PCmh77nE=;
        b=owrek1zpUfYauYu3wyJkz7Gyn24nxUnkrP7I+LFB2dcAzcV2RDLVCMalz0MA+cEQC9
         X0N4NXLjOzUV1HnB6D62LFiNY2yE2RExa9i89zjqOieZ/XIcUl33bsn3mNR2VfmmxXca
         lMxc0I43iB+U8OmDz9+Te6CvL6RoBceaqrzXeP01qvoRRdNXGL6y1/8685XEIoGEw4u/
         D1LCryQN/VwYLlvsegZrWo8sryF8ESQGLPc5X/Hm7Sx6ufotWLs5NphSrUtBTK2StFKN
         xfycw+79Y3IkRH9EkdEFhHlHULY0aQf0iuYdu0wpmGBS8aN0VQoYuXhJq4pTvCqAnDxu
         FoZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aSbmDYbQXdQPxizoSG6FnTQ35o8EjiHniz6PCmh77nE=;
        b=kAQxfNxzJ60NrwzbqMEDD97LE2Kk0u7Fa7rqVV2hkgKedB2FA3rUrsHEqQ7Qog5Exp
         lLN/KJm0WAa5ozhnhz3DGpAl+ZmEIsTHTF71Y9LHb/J9RjWXI3zbFiZNtwTLA9r19p/Z
         GY3F1o8VwVTwt5qC8caU2jzXFUlOex0KgqbelVbOS1x45wf4YMy/csFktNOsas4jLre1
         zLTh7JiRMo4v0/UWnDE1yLOPhxbguwcxDeIEeIJ9dZwsb5CD1kqN+3XAC3pDH1TpOWaN
         UveypbDd0vC/v1uxOVeEYfsSf128/D3kHeBo9XOHDv6KktALnGtkWo4L/l9F5APLdCvh
         wq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aSbmDYbQXdQPxizoSG6FnTQ35o8EjiHniz6PCmh77nE=;
        b=UxY2OwbXarYkwmfoDeIeRMxrKlcpunMm/sjSqLDaF8lRuBS0Ee6YQmMDWN3pkUJBcC
         BXdiZmy3bOErn7nzM+mVdjmf3mpcKMihqKdtodV2tW6MWj2VY0qBlRuomQCe31Esmbue
         c9qOKqx+hBzDy6sZogstZoSEx8L4NjAVq3CNOVfyhCeSoGQ191SHIbS8wkM6c+S0jD6u
         ttZD/2a0iEA2wNgLZvm+4O89213d/C12jLgG+YKMiawTuAlxY14tJEObtqJ5pU09G1F/
         chnTlZzJ9UE1qrtkJHa0yUW0McLU4LRAnbTSzrTk3jOSN3uBwIbQ3HZPgK1OKk2VpBk6
         0dOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV/l2tDQYIkxyb10ej44I+034eGhVIeg2Nb/QyfHEUnyooexeNw
	2gUugQnJ6bF57l1ngYrUY4A=
X-Google-Smtp-Source: APXvYqx1VsVtnkDs9MN/fjfS6phuAaxWV/AQYJtw7YZi766IAsoU5x6WeqgloTmWorCclm+2BaoNNw==
X-Received: by 2002:a9d:74c4:: with SMTP id a4mr31909083otl.119.1581016528543;
        Thu, 06 Feb 2020 11:15:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7193:: with SMTP id o19ls2125291otj.0.gmail; Thu, 06 Feb
 2020 11:15:27 -0800 (PST)
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr29712693oth.348.1581016527810;
        Thu, 06 Feb 2020 11:15:27 -0800 (PST)
Date: Thu, 6 Feb 2020 11:15:27 -0800 (PST)
From: Michael Hinton <michael.g.hinton@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <3d7d68d7-b54d-4610-b50d-528c1c2be781@googlegroups.com>
In-Reply-To: <9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3@siemens.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
 <20200120144629.201f3081@md1za8fc.ad001.siemens.net>
 <b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
 <20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
 <5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
 <20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
 <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
 <9c6c6364-c7a6-f2a4-507a-b5a9b1f6b8b3@siemens.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2_772061817.1581016527281"
X-Original-Sender: Michael.G.Hinton@gmail.com
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

------=_Part_2_772061817.1581016527281
Content-Type: multipart/alternative; 
	boundary="----=_Part_3_771920203.1581016527281"

------=_Part_3_771920203.1581016527281
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Thursday, February 6, 2020 at 12:06:05 PM UTC-7, Jan Kiszka wrote:
>
> On 06.02.20 20:00, Michael Hinton wrote: 
> > map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED); 
>
> Why are you mapping your RAM uncached? That's (roughly) only needed for 
> MMIO. 
>
I guess I was copying the other map_range() call used to set up the IVSHMEM 
from the ivshmem demo. So I have no particular reason.

I see that it sets the PG_PCD argument to the page table entry in 
map_range(). What does that do?

Should I set it to MAP_UNCACHED and see if that helps with performance?

Thanks,
-Michael

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3d7d68d7-b54d-4610-b50d-528c1c2be781%40googlegroups.com.

------=_Part_3_771920203.1581016527281
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jan,<br><br>On Thursday, February 6, 2020 at 12:06:05 P=
M UTC-7, Jan Kiszka wrote:<blockquote class=3D"gmail_quote" style=3D"margin=
: 0;margin-left: 0.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 0=
6.02.20 20:00, Michael Hinton wrote:
<br>&gt; map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED);
<br>
<br>Why are you mapping your RAM uncached? That&#39;s (roughly) only needed=
 for
<br>MMIO.
<br></blockquote><div>I guess I was copying the other map_range() call used=
 to set up the IVSHMEM from the ivshmem demo. So I have no particular reaso=
n.</div><div><br></div><div>I see that it sets the PG_PCD argument to the p=
age table entry in map_range(). What does that do?</div><div><br></div><div=
>Should I set it to MAP_UNCACHED and see if that helps with performance?</d=
iv><div><br></div><div>Thanks,</div><div>-Michael</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/3d7d68d7-b54d-4610-b50d-528c1c2be781%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/3d7d68d7-b54d-4610-b50d-528c1c2be781%40googlegroups.com<=
/a>.<br />

------=_Part_3_771920203.1581016527281--

------=_Part_2_772061817.1581016527281--
