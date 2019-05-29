Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBS7PXDTQKGQEONKR6SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0559A2D69B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 09:42:05 +0200 (CEST)
Received: by mail-oi1-x23f.google.com with SMTP id p83sf569695oih.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D1sBGwseZMqloz/0ysk9ZgHcJCELbp7sxiH94BTF/XU=;
        b=agIUplRhlAPxQsnZb3PIXRyuKLH/M4RsafkU+0ZNwiGcYoI9iKM0Elu5rGrJBbktiJ
         m9eEoyvqmRJmKeLFsae0WichW92vz9n6DsH0Ig1uR8yZ7RE8yoDJQyw0BlLtxUhO3A54
         LnZeQPKRLrA1tUxfMoK1k8GcnHF6KBKN6utcisy7tSLl5TrJnQuIVKPo6OlHYeTzPW8W
         OEilyKOMJLB6xArBF098H6A/H85LE5eMBlGNX96tjmfLCTo5HLdZwfYRRa2fhvxXfiOa
         4Adza/hkWGDOhMdX7GruSSiwjPBvcGqMmKSic/fgXFApuQkZhsC+/R7tZjDabZb5Twt7
         RvTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D1sBGwseZMqloz/0ysk9ZgHcJCELbp7sxiH94BTF/XU=;
        b=cZnw4bl0jhGbDMUQOxyF5GM3mfHZuoaRK0uH4/z3iWZJdmob0bdjOc3eLW4c6kIYNw
         U4ERfezRCOStT6FMZ6ZspczdTR9kH1GHYPXLo1AyaiZ6TWOS1tCVsXgw88cCYh6xLRNq
         Hke1vb6hvgutwyVGXWLG4CZg/i/p7/9iOUW6/COjwMIjZ/W1RFQa9IZXKev0I2dwpwQc
         sNRGG9pFMLoT2YI5v0Hpb5yyYf7EklOYGnyvziI5ereJsV6lhMKUmyFz4pVLkYOxKtPA
         8piIPahWAkgDBOAAUgWVzT5+MLzFZz6tDu0sGklXk0RvQUWzdNBKU+LFTF8W5lFXxFQn
         MReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=D1sBGwseZMqloz/0ysk9ZgHcJCELbp7sxiH94BTF/XU=;
        b=CVxFMYsGlIePCmLVSZjalZ2FpLLu2h98Zt7y3Oz/kal3QJp8VrXrP9AkuAEr32uLQz
         jRj4eoYxB727ue5cgJCRnAmKj+nzp/iF0qWq0BIhnbPFynTYU2uclRBA/+vzwmF31ULh
         Y6Jcx9gLTTf6L5gG13rDGlxTaPLhkkq3NChLBo917zji6bWbiynzTKHdjcQeQWGhaRuc
         Z1nJrZZ7RKBDnuyrBnSqu5eQgaQq5++LjpSQQhLSQPb2JgnrtbQJTNGC3lhQJdUfmmd8
         WMlypoxDT65mCmOFCweh02l+bZKFXZJT3Pa6+ilX4Rotl0GjfK1WzrQBZhn5EY7B1Tnc
         yyRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVvT4qMzEwiCQxcgYpY+nN6rEROfad9YEcM5dfYDL7I8FsdceRe
	thkMLOcwAT6kkmNMtMKObcs=
X-Google-Smtp-Source: APXvYqwgtdpb4NVvwdPbpTwfDofk7W8ZbGKn9bBqtEUz658q975mhNQJFdwmZdC/esu6gkI/zOOyxQ==
X-Received: by 2002:aca:b344:: with SMTP id c65mr5590239oif.46.1559115723649;
        Wed, 29 May 2019 00:42:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c512:: with SMTP id v18ls211613oif.1.gmail; Wed, 29 May
 2019 00:42:03 -0700 (PDT)
X-Received: by 2002:aca:4903:: with SMTP id w3mr5223177oia.154.1559115723024;
        Wed, 29 May 2019 00:42:03 -0700 (PDT)
Date: Wed, 29 May 2019 00:42:02 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ac030e22-9a4e-47b8-8c94-5e2866a80ae2@googlegroups.com>
In-Reply-To: <20190528210147.6dd80c1d@md1za8fc.ad001.siemens.net>
References: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
 <20190528210147.6dd80c1d@md1za8fc.ad001.siemens.net>
Subject: Re: Ivshmem-demo interrupt
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2791_132959620.1559115722495"
X-Original-Sender: jeanne.romefort@gmail.com
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

------=_Part_2791_132959620.1559115722495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 mai 2019 21:01:52 UTC+2, Henning Schild a =C3=A9crit=C2=A0:
> Am Tue, 28 May 2019 06:22:05 -0700
> schrieb <jeanne.***@gmail.com>:
>=20
> > Hello everyone,=20
> >=20
> > I'm trying to run the ivshmem-demo on a lanner NCA-510A. The inmate
> > cell seems to be working well. However, I can't get the interruptions
> > between the cells to work. Is this due to a configuration problem?
> > (You will find attached my configuration files) I explain : when I
> > launch the inmate the shared memory is written but the inmate doesn't
> > react to the uio_send and there is nothing to read in the uio_read...
>=20
> The ivshmem guestcode repo is not tested as well as jailhouse. And
> together with kernels there are now 3 components to combine. So i would
> not be surprised if your problem has to do with that uio linux example.
> But it is not horribly broken and should work! The main issue with it
> is that people do not read the docs and check out the wrong branch,
> later use the python code ... which is not tested on jailhouse ...
>=20
> I would suggest two ivshmem-demo cells before you
> even look at linux+uio. That way you get isvhmem-guestcode out of the
> picture and will start with just jailhouse.
> Especially since you later want to run linux in another cell anyways.
>=20
> > here is my :
> > grep ivshmem /proc/interrupts
> >  202:          0          0          0          0          0
> > 0          0          0          0          0          0
> > 0          0          0          0          0          0
> > 0          0          0          0          0          0  IR-PCI-MSI
> > 229376-edge      uio_ivshmem
> >=20
>=20
> > Second question: the next step of my project will be to run the
> > uio_ivshmem driver between two linux cells. Is it possible or is the
> > driver only for the rootCell?=20
>=20
> The uio stuff will work in either root or non-root, no problem. That
> is, if it works.
>=20
> Henning
>=20
> > best regards,=20
> >=20
> > Jeanne=20
> >

Hello everyone,=20


First of all, thank you very much for your help!=20



I can get two inmates ivshmem-demo to work without any problems with all th=
e interruptions.=20



For the driver uio_ivhsmem I took the jailhouse branch on the git. The file=
 /dev/uio0 pops well and my ivshmem-demo inmate writes well on it. However,=
 there are still no interruptions...=20

Here is my lspci -v on my virtual PCI on the rootCell side. Is this good ?=
=20

lspci -v=20
00:0e.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared memory
        I/O behind bridge: 0000e000-0000efff

Best regards,=20

Jeanne=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ac030e22-9a4e-47b8-8c94-5e2866a80ae2%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2791_132959620.1559115722495--
