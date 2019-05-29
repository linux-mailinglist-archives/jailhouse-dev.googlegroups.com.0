Return-Path: <jailhouse-dev+bncBDCN3RNB2MDRBZNOXHTQKGQEM3K43TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD362D9B7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 11:56:54 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id 7sf678035oie.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 May 2019 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=knPGn8qLPFggQsRxGsYLIxUZ19nFM34lhMZ+RRFGMuI=;
        b=srj504XSaRZeNXqO9RzqXzqeduZ2C8NlIP9yeLts+cSKugbqCf79GCvVtqRDZDEFSa
         rMz/5gJXUMHQZUQwnpiRjcE2YkKqyyaMczJ3RXGAkwBPc/zqdKauqtTv7MlQSXRy7Jso
         B7wWnzpcb/507iHsvGOK958xEZvNQxtaDqalPT9u+O2wlsM4D+MKule9DdxFsrwB9Brl
         qC+gw2NyYL830jAda4ZlYS8O/dsPvyoNtU+PQo1nXKclho3vGiERef+3GenKiCG0J+SD
         wch4oznb1ChTOePtThPUzouoqlv3/0ViucGTQsGrew4cPu9s3GIEsmHK4ZaLJwHtguI3
         zzQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=knPGn8qLPFggQsRxGsYLIxUZ19nFM34lhMZ+RRFGMuI=;
        b=dIVqpFMQIRWExLP8nGA60Hq3o4d9uIG5AfbssLBZW8aHjCgstH2MyFKpMkq3UVzBez
         6cF/OUarBCUXAHV2byMfsYtocx90myCWKIJ0QIwLMC9GLRF2YcJwmBdRf+KTZfASCOmI
         Ay8GUPjLb0yl59ZMnVxKFRHM0nftNzK+WFw3IF7P06521GotkrkeW/hwHOtejNCA3KXJ
         qf9+IZGCKR95e6pYTaFsDNEbKsdqLwXQAb3rDZfji0zxIHwNs5BTkud+I4st6DDLRGL5
         Ve8jZeU/TSbf6u/ZzsaGXpherA5KwsbP0yA/lF4mJaN9mp0OO5W7tfQgcsfkV4A/+wMY
         1+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=knPGn8qLPFggQsRxGsYLIxUZ19nFM34lhMZ+RRFGMuI=;
        b=UXiHBPG2m1kXdfG7dvkjQ/lQTRov+9NG6Z9sJIbfNkmvgMqFigbji36n4AEF4toicR
         XqqcLTn64J16VI6SwwRzupvLinJAP9pCW8KDPyVeEmTpQ1AJPvdb4Utw60EIaBBjHN9k
         PDhy9xTiJWOwSZbydz4V0hjDHxmHNGEPJdpqOObz3fOpqhVwn8PxirneT2/zOU0LpCer
         Ky+J1WDuVKmcCjfGxmKIeB8sOmDAx0KB8QYeTPogx1lcIIQO+MbckjbkOP5z/wHY5Q0T
         MNi8uQDl7fFtoMxNEcEfAoETRB8O9+tfxhrv17hRl9P8GfRTPzEbrBdJuMIMYya+Y+75
         PvoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV6dFfAnUDDKrjWOfD5mkkCXpj8Nuk/vBKJDn3Kl8eQO70KeSet
	6BohTycoX8tPtRVhP44UtVE=
X-Google-Smtp-Source: APXvYqwsJdEFvq1R33AVX+p2N70rbOL58xIyQjRSwnI+ipLcOKiJ1VRKs6kGqMFSaRJGUZkmPtjTLQ==
X-Received: by 2002:aca:dcc2:: with SMTP id t185mr5836135oig.136.1559123813650;
        Wed, 29 May 2019 02:56:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:a8c2:: with SMTP id r185ls256942oie.15.gmail; Wed, 29
 May 2019 02:56:53 -0700 (PDT)
X-Received: by 2002:aca:3d46:: with SMTP id k67mr63480oia.66.1559123813055;
        Wed, 29 May 2019 02:56:53 -0700 (PDT)
Date: Wed, 29 May 2019 02:56:52 -0700 (PDT)
From: jeanne.romefort@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a132b6de-0483-4e2f-a5e8-56d8ed4eaae5@googlegroups.com>
In-Reply-To: <ac030e22-9a4e-47b8-8c94-5e2866a80ae2@googlegroups.com>
References: <e0e9eaef-1cff-4d61-a820-e007271ff7b2@googlegroups.com>
 <20190528210147.6dd80c1d@md1za8fc.ad001.siemens.net>
 <ac030e22-9a4e-47b8-8c94-5e2866a80ae2@googlegroups.com>
Subject: Re: Ivshmem-demo interrupt
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_852_1290104077.1559123812560"
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

------=_Part_852_1290104077.1559123812560
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 29 mai 2019 09:42:02 UTC+2, jeanne....@gmail.com a =C3=A9crit=
=C2=A0:
> Le mardi 28 mai 2019 21:01:52 UTC+2, Henning Schild a =C3=A9crit=C2=A0:
> > Am Tue, 28 May 2019 06:22:05 -0700
> > schrieb <jeanne.***@gmail.com>:
> >=20
> > > Hello everyone,=20
> > >=20
> > > I'm trying to run the ivshmem-demo on a lanner NCA-510A. The inmate
> > > cell seems to be working well. However, I can't get the interruptions
> > > between the cells to work. Is this due to a configuration problem?
> > > (You will find attached my configuration files) I explain : when I
> > > launch the inmate the shared memory is written but the inmate doesn't
> > > react to the uio_send and there is nothing to read in the uio_read...
> >=20
> > The ivshmem guestcode repo is not tested as well as jailhouse. And
> > together with kernels there are now 3 components to combine. So i would
> > not be surprised if your problem has to do with that uio linux example.
> > But it is not horribly broken and should work! The main issue with it
> > is that people do not read the docs and check out the wrong branch,
> > later use the python code ... which is not tested on jailhouse ...
> >=20
> > I would suggest two ivshmem-demo cells before you
> > even look at linux+uio. That way you get isvhmem-guestcode out of the
> > picture and will start with just jailhouse.
> > Especially since you later want to run linux in another cell anyways.
> >=20
> > > here is my :
> > > grep ivshmem /proc/interrupts
> > >  202:          0          0          0          0          0
> > > 0          0          0          0          0          0
> > > 0          0          0          0          0          0
> > > 0          0          0          0          0          0  IR-PCI-MSI
> > > 229376-edge      uio_ivshmem
> > >=20
> >=20
> > > Second question: the next step of my project will be to run the
> > > uio_ivshmem driver between two linux cells. Is it possible or is the
> > > driver only for the rootCell?=20
> >=20
> > The uio stuff will work in either root or non-root, no problem. That
> > is, if it works.
> >=20
> > Henning
> >=20
> > > best regards,=20
> > >=20
> > > Jeanne=20
> > >
>=20
> Hello everyone,=20
>=20
>=20
> First of all, thank you very much for your help!=20
>=20
>=20
>=20
> I can get two inmates ivshmem-demo to work without any problems with all =
the interruptions.=20
>=20
>=20
>=20
> For the driver uio_ivhsmem I took the jailhouse branch on the git. The fi=
le /dev/uio0 pops well and my ivshmem-demo inmate writes well on it. Howeve=
r, there are still no interruptions...=20
>=20
> Here is my lspci -v on my virtual PCI on the rootCell side. Is this good =
?=20
>=20
> lspci -v=20
> 00:0e.0 Unassigned class [ff00]: Red Hat, Inc Inter-VM shared memory
>         I/O behind bridge: 0000e000-0000efff
>=20
> Best regards,=20
>=20
> Jeanne

Hello everyone,=20


Now I can get the demo-ivshmem to work with my root cell too (it seems that=
 removing the.shmem_protocol in the pci_device unlocked the situation I don=
't know why).=20
Now I'm trying to get this driver to work on my inmate linux but when I ins=
ert the module I don't have a /dev/uio0 that pop and I don't know why... an=
y ideas?

here is my inmate :=20

# insmod /bin/test/uio_ivshmem.ko
uio_ivshmem: loading out-of-tree module taints kernel.
uio_ivshmem 0000:00:0e.0: enabling device (0000 -> 0002)
# lsmod
Module                  Size  Used by    Tainted: G
uio_ivshmem            16384  0

So the module is well loaded and I don't need to modprobe uio because it's =
already done in my kernel.

Best regards,=20

Jeanne=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a132b6de-0483-4e2f-a5e8-56d8ed4eaae5%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_852_1290104077.1559123812560--
