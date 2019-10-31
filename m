Return-Path: <jailhouse-dev+bncBCDJXM4674ERBVE55XWQKGQE5J2PKWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 41872EB8CB
	for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 22:15:04 +0100 (CET)
Received: by mail-oi1-x238.google.com with SMTP id x125sf4481659oig.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Oct 2019 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BsRaWyjnLl0UJV9uQP4DYJxSwFHezSIzQi4kpo4C34c=;
        b=PtJIYT009f+qg/W/CpV7OwhmRLNp2wA2pF5Kk/yAQbjmb8CPZkpswvdmPPTjmd14CN
         o6IyMaaOaej4slxfC1oJHFbJEHq7XBGns6X1rRo2DAXXylx9iV+nPQeRZ0GmEYqOv+Rr
         05A7EI5+DCoCCjF7a/t3eTXgO1e0r6+vA2RbyLpcxIRY7IbM7JO8OzQ3NY/tpN/IuN0k
         vVGPCe85mb1PLmeq4bTTl3i/eKkmg3sNK3jcYnAZSVJqv+0KjhZQjZNrGdrYLHf80i5+
         RxhhZbDakvfmI7zShyET5Q9AQhi+YCi9izCJE0xCIYya9Qsj2Z1G0+9CTper0nz/x17I
         Z7Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BsRaWyjnLl0UJV9uQP4DYJxSwFHezSIzQi4kpo4C34c=;
        b=knTjXDrLmLhEmZCsryBewMmAbovM20lSmfNHh2fsfiZPCppTxnm3wIPj87at3Ote7b
         is68CAF4xWYIO9WEXI2Je0HUhrVCQ/2qiVKrYZCgd3WGIHnUBVm/7kzH5CqxMVUat8me
         yxZUBoRanrWBolww2J6zny2bMwBE0Oa8xEkQn6ZfUuFZrbKguy0eRj/B9r8UQVjAFPmi
         tULHuGZdx9RswkGW+7qJOqx5hXc+wMmyYltCQxMGhwIkRFzn9o2SDO4dpcaznxdcqNgZ
         ed7U4YBoKWXxym7MHSV0MrZP0lZKphIJzxThWWsSKIjzlZH/DTdQGgr71BSo5b/0xU6R
         UiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BsRaWyjnLl0UJV9uQP4DYJxSwFHezSIzQi4kpo4C34c=;
        b=qoDbb23MUQpXCTgyFGLP2Megc/od4muRWKcxzD6bBpYur/C8Hj3kWHVcYXZIrbzqMx
         ls3qPoFbnzZvnX9jM803tBghI/WaMTBhgMMl7nX0XYR3HJXbhi9lhkSJp/oQJI/Ea8r3
         TwXHkaj+GVwQoa3u2ZcuKVFet7XI4RllaDsU0qTxjnPrfE0icwwl3p1mXAPcpkg27SLV
         AeNebsT1K3fu/MRSMtRf06cObc39TR5ihju/nSkadF4fVaeWlbMkkN/59h/1YangRgle
         rnW8mmTbaS/kR+ZigA60jSrOlCklTB6IjEhOMfSBRalx1hi9g52Z/qSpfflnznnTDgbI
         Rgkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXlrpzawlPfIUrlEevbl2aEav2G7OnOuWwzPYbx/oQ0S7N4o6VW
	1o86fWqzjaID/JZQcFZ/Pwo=
X-Google-Smtp-Source: APXvYqwAdi+PvB8mLM4J3YZ+JhAk+RCW/o8/14kFEGHjObJtiha7T54edapnd7pqKIzIbTjY1FRvHg==
X-Received: by 2002:aca:b445:: with SMTP id d66mr1408930oif.111.1572556501021;
        Thu, 31 Oct 2019 14:15:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:740e:: with SMTP id n14ls896330otk.10.gmail; Thu, 31 Oct
 2019 14:15:00 -0700 (PDT)
X-Received: by 2002:a05:6830:1f51:: with SMTP id u17mr6392367oth.318.1572556500363;
        Thu, 31 Oct 2019 14:15:00 -0700 (PDT)
Date: Thu, 31 Oct 2019 14:14:59 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0d4ba667-fb8f-40a6-becf-69958143de2b@googlegroups.com>
In-Reply-To: <01105881-d1d1-4931-b950-0b6028cd5ac5@googlegroups.com>
References: <01105881-d1d1-4931-b950-0b6028cd5ac5@googlegroups.com>
Subject: Re: TSC Frequency
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_75_160361854.1572556499842"
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

------=_Part_75_160361854.1572556499842
Content-Type: multipart/alternative; 
	boundary="----=_Part_76_1421698569.1572556499842"

------=_Part_76_1421698569.1572556499842
Content-Type: text/plain; charset="UTF-8"

I guess I should clarify (for my future sake, at least) that the Jailhouse 
driver automatically passes this Linux-derived frequency into each cell's 
config, while I'm planning on measuring frequency information from the MSRs 
directly within an inmate.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0d4ba667-fb8f-40a6-becf-69958143de2b%40googlegroups.com.

------=_Part_76_1421698569.1572556499842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I guess I should clarify (for my future sake, at least) th=
at the Jailhouse driver automatically passes this Linux-derived frequency i=
nto each cell&#39;s config, while I&#39;m planning on measuring frequency i=
nformation from the MSRs directly within an inmate.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0d4ba667-fb8f-40a6-becf-69958143de2b%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0d4ba667-fb8f-40a6-becf-69958143de2b%40googlegroups.com<=
/a>.<br />

------=_Part_76_1421698569.1572556499842--

------=_Part_75_160361854.1572556499842--
