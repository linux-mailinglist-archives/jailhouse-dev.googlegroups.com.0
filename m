Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBMGPQ32AKGQEGL7TNAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF50197617
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Mar 2020 10:02:57 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id l3sf6996464lfe.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Mar 2020 01:02:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585555377; cv=pass;
        d=google.com; s=arc-20160816;
        b=DkIbma6mbST8MmklHd6XY1KM2oiyXanYrVCWRrQduQ24vGHbHLaIkYHplYCvCjhSZS
         YpDrJcjns+3TIxTOfyluvjL0+VtSQO4QgxFaGytAAKYJXI2TaqSrXXu3R+CdCKwkSrrT
         BNO3aXxEN1DL5qOsqEc3mDacN4z00D4X7Uvvu1gAu32JDCKNW3zK7NbYLGG3LRca6/JM
         VgKF6tNUvqjqt4KVeqtXagzCnalIMdjX6PcGFDEocvSGnPKJV1YO2ghF+9B8xOtEvaww
         p8UzIxEttL6eMxRPtvloqodUU2MUqWwz1bUyRgZoEoi7NSHahWx3in/R5iXRbAEyMVqq
         cQ+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=QoER7PSvdpNQ2GRGVk/gj0dW3NHoiy8x7GN7gzjiDdE=;
        b=peWNXPwSuSxwoLhv9l1ZMn9tM6+1MHOAQTrWDZbGKTj37HgUI9ha6XPqRe0XaSPj6O
         SUvi3hrDkVuGvh6+scYN8gjbHM+DDne52kbFXspe3NO7M45bnCO0yHK+sAWstlTwobik
         +J0hBhM8b6gu4wUuR8igFFvxm4kg5E6KqSC5IhphNvMhCJEjpDZtsrfn7AZZx2Rb3za2
         XsZAbevN1qmprX0b6bdRXEKTecBzT/jPgtKg4KjerreerWcboN8QBpyXqLL9z2wyBXoz
         x4MdLlo9o0kVJVWWz0IccNseVS2F8vlZkf13KJqNkcypyTN/MHbKOMwnUJ7EyTuE8B5/
         y0Hw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aKAMs6dR;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QoER7PSvdpNQ2GRGVk/gj0dW3NHoiy8x7GN7gzjiDdE=;
        b=E+ixl3lFEyH6t1vVslY6bBHtbi9neCrebWqf3mPwuzknGS+j0W5KYnKhU2nek0Cfgv
         Odtlks5pbCXLlfwXSdMC8Q/OlMC2u1Va/XZCY3Yhy6UenpIVvYezN8p/tVLr/a+L/3L7
         +KztxWlMJrlZjUkG8gbvwvkLLSB4hymMQjrvSArDbajwkLoXh0fEzqyHUBewy81zC9pX
         vSPMeAWqohHjpP0FQ1les/jbZdC4gS3IXL2wcYUT2MDLJXuH0lw97chWxj6g0kZ0E4eZ
         zy/gr3nC6Hk0ct5G2Gisrr3VB4EuVnsg040BDKfUrtE7wUejjpaIb3HD8c0Fq7AEysYO
         nJAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QoER7PSvdpNQ2GRGVk/gj0dW3NHoiy8x7GN7gzjiDdE=;
        b=jFkBZttON8kis0iVbFrICYCI2KP80zukNw0N9/qKvPloi5I22Hpd4qsgGYQMVsfyqc
         DNrYXn3zpQ3K5Q24E2qYGuyEoerH6KT87VOzt6tcSBuxYw2dlMc7w2tqR4VGe9NDOc9w
         eE3ta84BBm7CI24B6SBY+Cyzar8Np6hlKQqca6LRlmEKTFAqAfr51zffjL+xisi4IBpw
         0dLtUJnJoajsRb6FOkjYpbGvi1A68Ukim/WtmVHJhlf7dVXuTJJQTetWBBDpWeZGDnRP
         iI0vbK6lc7wUyagkc1nLgaQFNkWiG738fsLv0qweyA587Z1seaJCQT7N9yQQLXJaN+zo
         LtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QoER7PSvdpNQ2GRGVk/gj0dW3NHoiy8x7GN7gzjiDdE=;
        b=K4Jzh0hxS+6ZSVmvUpgN2kWPWfQ2D82lGueRsbUIpwMAM3/XQeHuY+wDzTNxWxnywU
         ceFbbrRWPfW2hZFEyACARJ8T5quhU4jRaJe93t4uFyvgkobrj9vfXTr+ZE+ZKfGr0p3x
         9RK932vY8V6P67azl1G+8sAqVLIp49cWtJ8liB+sUkNbeEiaWITk7kX3psVBgSUZ/fHM
         GBYSIL7qOHKqyVoU+vjHF55agEUc0ldBQ3aCgK7nQl6jl6wQ61vn7dEmHvk6dWFWNSWo
         un5sRoq3c1C/XEreGAmm9BZFeDBnjKu3usQnva6MRxVo8C9KJ9YE3iKT5Ms7y8V6E7bd
         vuwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuapTuI7ikB3LxD6C7iQTl3hCk0eRpCejH43C8fMidEf7gV5v8Rw
	DmPh1NRuGZIgR+/iCcTzvG4=
X-Google-Smtp-Source: APiQypJylzUINVGuUx+atSkgqNXYXgMYAJyqTRRZNd3D+huGyD+8tZHM2WGvl+i4a0lMuFes3LyfiQ==
X-Received: by 2002:a2e:6809:: with SMTP id c9mr6327465lja.251.1585555377021;
        Mon, 30 Mar 2020 01:02:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5085:: with SMTP id f5ls62184lfm.6.gmail; Mon, 30 Mar
 2020 01:02:56 -0700 (PDT)
X-Received: by 2002:a05:6512:3115:: with SMTP id n21mr7570335lfb.51.1585555376233;
        Mon, 30 Mar 2020 01:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585555376; cv=none;
        d=google.com; s=arc-20160816;
        b=mz5rp1vfkViTweNO68H67xeKzr/jeCjjlo71/tfJ8ma/c0xDEFJcO2xeygYe2J+sNU
         C6bakuuAaCaHMJWsEAArBLdXGb7+8x4yIqqf5gsUUw928C3OaQAlAwirJVSClh+7E0l5
         xlv0jwTaClVgJMm1Le4NxRb4ARkF5e3YqH6NbC/BQi0WRu3YzufMnM9Ez+lNCnu9c42B
         NRVmXXd5Ge2v3ddXlGhFj6M6xazhwl9GPBqLg9fgFYDUiL370Hrtg3h6ELloDxbtuP+3
         NfjAHtDo4yfaFLEGRo4+uvcwm053cv9sefFKWzXfrkOtEW02Kk+b5XTIkYBjDqlMwcw5
         /JoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gEIDC+qa97WQqf0AOTfbf+GbzFozXhZvYpsb78rnnwU=;
        b=FLrvzi0T2Fk3EZ7r5wlF+RpH0OKiu7zGVh0G7cLDm/UZSB/GfretihGXGTqsPk7d/h
         ss/ujJieXyA5r+H6PyIfzTaR7gjEkC4po/lNANNNaE+46piCpti3a3OIQNrGR7+TKC/9
         XCQk+VubnPlXlaPF8H1MZTWhaRH7PiiRjFCnfVXyS0YEDmYnUKrNLVj+cm/xdlqZB3xj
         o1zkgfH8D+M9jiveK2LzeKEJyoXcfHKtN7ybXITOPlHp1ylqMBQ6v0ODzA7j3dkD0aTo
         cC1uAeToLx1A8Y63dL9w2LrWyFkp7OWQ442U50gCltu8JO076Y1aJvGoWWAH10+0G7zc
         g4Pw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=aKAMs6dR;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com. [2a00:1450:4864:20::534])
        by gmr-mx.google.com with ESMTPS id e4si575715ljn.1.2020.03.30.01.02.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2020 01:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::534 as permitted sender) client-ip=2a00:1450:4864:20::534;
Received: by mail-ed1-x534.google.com with SMTP id i7so14605394edq.3
        for <jailhouse-dev@googlegroups.com>; Mon, 30 Mar 2020 01:02:56 -0700 (PDT)
X-Received: by 2002:a50:9d83:: with SMTP id w3mr10494833ede.23.1585555375944;
 Mon, 30 Mar 2020 01:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com> <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
 <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de> <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
 <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de>
In-Reply-To: <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de>
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Mon, 30 Mar 2020 03:02:19 -0500
Message-ID: <CAD6ScS-ZpOunQC0EhfDTQaPX_ua=dcCccF+UwMoLo=o+ROE42A@mail.gmail.com>
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com, 
	"libvir-list@redhat.com" <libvir-list@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f479dd05a20de024"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=aKAMs6dR;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::534 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000f479dd05a20de024
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Sat, Mar 28, 2020 at 4:12 AM Jan Kiszka <jan.kiszka@web.de> wrote:

> On 28.03.20 08:47, PRAKHAR BANSAL wrote:
> > Hi Jan,
> >
> > Thanks for the reply!
> >
> > I was only considering the command-line tool "code" for reference to the
> > Jailhouse kernel API(ioctl calls) because I didn't find a documentation
> > of the Jailhouse kernel APIs.
>
> Right, the IOCTL API is not documented so far. It is currently only used
> inside the Jailhouse project. This needs to be formalized when there
> shall be external users like a libvirt driver.
>
> That might be a nice small contribution task: Create some
> Documentation/driver-interfaces.md that describes the IOCTLs along with
> their parameter structures and that also includes the current
> sysfs-entries.txt as a section. Then send this as patch here. I'll help
> out when details are not clear from reading the code.
>
>   Sure. I will do that.

> >
> > For the second part as you mentioned that Jailhouse can only create
> > cells with the constraints defined in the root cell configuration. I
> > have a few questions regarding that.
> >
> > 1. Is there a way to know if Jailhouse is enabled on the host and get
> > the root cell configuration(s) from Jailhouse through an API? This can
> > be used while binding the libvirt to the Jailhouse hypervisor.
>
> Look at
>
> https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-entries.txt
> for what is reported as runtime information. Full configurations can't
> be read back at this point. This might be reconsidered in the light of
> [1], but I wouldn't plat for that yet.
>

  Ok, sure. I am looking into it.

>
> >
> > 2. If Jailhouse is not enabled(again can we know this using some API)
> > then, can libvirt enable/disable Jailhouse during the libvirt binding of
> > the Jailhouse driver with a given set of Jailhouse cell configurations
> > describing a complete partitioned system?
>
> With the API above and a given configuration set, yes. The config set
> would have to be provided to the libvirt driver in some to-be-defined
> way (e.g. /etc/libvirt/jailhouse.conf -> /etc/libvirt/jailhouse/*.cell).
>
>  Cool, got it. Thanks!


> >
> > 3. I was wondering, as you mentioned that libvirt driver should check
> > for mismatch of the cell configuration with the root cell configuration,
> > the question is, isn't that done by Jailhouse itself? If yes, then
> > libvirt can just pass on the cell creation requests to Jailhouse and
> > return the response to the user as it is, rather than driver doing any
> > such mismatch check.
>
> With matching I'm referring to a libvirt user request like "create a
> domain with 2 CPUs", while there are no cells left that have more than
> one CPU. Or "give the domain 1G RAM", and you need to find an available
> cell with that much memory. Those are simple examples. A request that
> states "connect the domain to the host network A" implies that a cell
> has a shared-memory link to, say, the root cell that can be configured
> to bridge this. But let's keep that for later and start as simple as
> possible.
>

  Do I need to match the libvirt user-requested cell config with only root
cells or with all cells present at that time?

I wanted to request you for a favor for the proposal as the deadline is
approaching. Could I prepare a proposal for this project based on our
discussion here and improve it later based on feedback comments after the
deadline? I understand that I got late in starting on the project search
and selection.

Thanks,
Prakhar


>
> Jan
>
> [1]
>
> https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com
>
> >
> > -Prakhar
> >
> > On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka <jan.kiszka@web.de
> > <mailto:jan.kiszka@web.de>> wrote:
> >
> >     Hi Prakhar,
> >
> >     On 25.03.20 05:36, PRAKHAR BANSAL wrote:
> >      > Hi Jan,
> >      >
> >      > Thanks for the reply. I looked deeper into the libvirt and
> Jailhouse
> >      > source code and found following two things that seem relevant to
> the
> >      > project I am interested in.
> >      >
> >      > - Libvirt driver interface at [libvirt.git]
> >      > <https://libvirt.org/git/?p=libvirt.git;a=tree;hb=HEAD> / src
> >      > <https://libvirt.org/git/?p=libvirt.git;a=tree;f=src;hb=HEAD> /
> >     driver.h
> >      >
> >     <
> https://libvirt.org/git/?p=libvirt.git;a=blob_plain;f=src/driver.h;hb=HEAD
> >
> >      > - Jailhouse tool, which is using the ioctl API of the Jailhouse,
> >      > available at
> >      >
> https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
> >      >
> >      > With the help of the above two, it looks like, a libvirt driver
> >     for the
> >      > Jailhouse can be implemented. Let me know if I am moving in the
> right
> >      > direction so far.
> >
> >       From the Jailhouse perspective, it is important to not consider the
> >     command line tool an interface anymore (like in the first prototype)
> but
> >     build on top of the Linux driver API (ioctls, sysfs). There is
> already a
> >     Python library which started to abstract this interface for
> >     Jailhouse-internal use cases. However, I strongly suspect libvirt
> will
> >     rather want a native binding.
> >
> >      >
> >      > I have been looking at the other libvirt driver implementations
> for
> >      > hypervisors like HyperV and VMware to understand their
> implementation
> >      > and learn from there.
> >
> >     As Jailhouse is a static partitioning hypervisor without abstraction
> of
> >     the underlying hardware, your starting point for the libvirt binding
> >     should be a given set of Jailhouse cell configurations describing a
> >     complete partitioned system. So rather than instantiating on demand a
> >     domain (Jailhouse cell) with, say, a network adapter, the driver
> should
> >     match a user request for a domain against the configuration set and
> use
> >     what is there - or report the mismatch. What it could organize,
> though,
> >     is interconnecting cells that have a (preconfigured) virtual network
> >     link to the root cell.
> >
> >     Due to this different concept, there will be no 1:1 mapping for
> >     commodity hypervisor drivers to the Jailhouse scenario. Still,
> studying
> >     what they do is useful and needed in order to understand what
> "normally"
> >     happens and find a reasonable translation. This is probably the most
> >     challenging part of the project.
> >
> >     Jan
> >
>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS-ZpOunQC0EhfDTQaPX_ua%3DdcCccF%2BUwMoLo%3Do%2BROE42A%40mail.gmail.com.

--000000000000f479dd05a20de024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Jan,</div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 28, 2020 at 4:12 =
AM Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex">On 28.03.20 08:47, PRAKHAR BANSAL wr=
ote:<br>
&gt; Hi=C2=A0Jan,<br>
&gt;<br>
&gt; Thanks for the reply!<br>
&gt;<br>
&gt; I was only considering=C2=A0the command-line tool &quot;code&quot; for=
 reference to the<br>
&gt; Jailhouse kernel API(ioctl calls) because I didn&#39;t find a document=
ation<br>
&gt; of the Jailhouse kernel APIs.<br>
<br>
Right, the IOCTL API is not documented so far. It is currently only used<br=
>
inside the Jailhouse project. This needs to be formalized when there<br>
shall be external users like a libvirt driver.<br>
<br>
That might be a nice small contribution task: Create some<br>
Documentation/driver-interfaces.md that describes the IOCTLs along with<br>
their parameter structures and that also includes the current<br>
sysfs-entries.txt as a section. Then send this as patch here. I&#39;ll help=
<br>
out when details are not clear from reading the code.<br>
<br></blockquote><div>=C2=A0 <font color=3D"#a64d79">Sure. I will do that.=
=C2=A0</font></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color=
:rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; For the second part as you mentioned that Jailhouse can only create<br=
>
&gt; cells with the constraints defined in the root cell configuration. I<b=
r>
&gt; have a few questions regarding that.<br>
&gt;<br>
&gt; 1. Is there a way to know if Jailhouse is enabled on the host and get<=
br>
&gt; the root cell configuration(s) from Jailhouse through an API? This can=
<br>
&gt; be used while binding the libvirt to the Jailhouse hypervisor.<br>
<br>
Look at<br>
<a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentation/s=
ysfs-entries.txt" rel=3D"noreferrer" target=3D"_blank">https://github.com/s=
iemens/jailhouse/blob/master/Documentation/sysfs-entries.txt</a><br>
for what is reported as runtime information. Full configurations can&#39;t<=
br>
be read back at this point. This might be reconsidered in the light of<br>
[1], but I wouldn&#39;t plat for that yet.<br></blockquote><div><br></div><=
div>=C2=A0<font color=3D"#c27ba0"> </font><font color=3D"#a64d79">Ok, sure.=
 I am looking into it.=C2=A0</font></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; 2. If Jailhouse is not enabled(again can we know this using some API)<=
br>
&gt; then, can libvirt enable/disable Jailhouse during the libvirt binding =
of<br>
&gt; the Jailhouse driver with a given set of Jailhouse cell configurations=
<br>
&gt; describing a complete partitioned system?<br>
<br>
With the API above and a given configuration set, yes. The config set<br>
would have to be provided to the libvirt driver in some to-be-defined<br>
way (e.g. /etc/libvirt/jailhouse.conf -&gt; /etc/libvirt/jailhouse/*.cell).=
<br>
<br></blockquote><div>=C2=A0<font color=3D"#a64d79">Cool, got it. Thanks!</=
font></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-l=
eft-color:rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; 3. I was wondering, as you mentioned that libvirt driver should check<=
br>
&gt; for mismatch of the cell configuration with the root cell configuratio=
n,<br>
&gt; the question is, isn&#39;t that done by Jailhouse itself? If yes, then=
<br>
&gt; libvirt can just pass on the cell creation requests to Jailhouse and<b=
r>
&gt; return the response to the user as it is, rather than driver doing any=
<br>
&gt; such mismatch check.<br>
<br>
With matching I&#39;m referring to a libvirt user request like &quot;create=
 a<br>
domain with 2 CPUs&quot;, while there are no cells left that have more than=
<br>
one CPU. Or &quot;give the domain 1G RAM&quot;, and you need to find an ava=
ilable<br>
cell with that much memory. Those are simple examples. A request that<br>
states &quot;connect the domain to the host network A&quot; implies that a =
cell<br>
has a shared-memory link to, say, the root cell that can be configured<br>
to bridge this. But let&#39;s keep that for later and start as simple as<br=
>
possible.<br></blockquote><div><br></div><div>=C2=A0 <font color=3D"#a64d79=
">Do I need to match the libvirt user-requested cell config with only root =
cells or with all cells present at that time?</font></div><div><font color=
=3D"#a64d79"><br></font></div><div><font color=3D"#a64d79"><span style=3D"c=
aret-color: rgb(166, 77, 121);">I wanted to request you for a favor for the=
 proposal as the deadline is approaching. Could I prepare a proposal for th=
is project based on our discussion here and improve it later based on feedb=
ack comments after the deadline? I understand that I got late in starting o=
n the project search and selection.</span></font></div><div><font color=3D"=
#a64d79"><span style=3D"caret-color: rgb(166, 77, 121);"><br></span></font>=
</div><div><span style=3D"caret-color: rgb(166, 77, 121);"><font color=3D"#=
000000">Thanks,</font></span></div><div><span style=3D"caret-color: rgb(166=
, 77, 121);"><font color=3D"#000000">Prakhar</font></span></div><div><font =
color=3D"#a64d79">=C2=A0=C2=A0</font></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
Jan<br>
<br>
[1]<br>
<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZn=
w%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com" rel=3D"noreferrer" =
target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1Q=
iRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com</a><br>
<br>
&gt;<br>
&gt; -Prakhar<br>
&gt;<br>
&gt; On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka &lt;<a href=3D"mailto:jan.k=
iszka@web.de" target=3D"_blank">jan.kiszka@web.de</a><br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@web.de" target=3D"_blank">jan.=
kiszka@web.de</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Prakhar,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 25.03.20 05:36, PRAKHAR BANSAL wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks for the reply. I looked deeper into th=
e libvirt and Jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; source code and found following two things th=
at seem relevant to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; project I am interested in.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Libvirt driver interface at [libvirt.git]<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"https://libvirt.org/git/?p=3Dl=
ibvirt.git;a=3Dtree;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">https:/=
/libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD</a>&gt;=C2=A0/ src<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;<a href=3D"https://libvirt.org/git/?p=3Dl=
ibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank"=
>https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD</a>&gt=
;=C2=A0/<br>
&gt;=C2=A0 =C2=A0 =C2=A0driver.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://libvirt.org/git/?p=3Dlibvirt=
.git;a=3Dblob_plain;f=3Dsrc/driver.h;hb=3DHEAD" rel=3D"noreferrer" target=
=3D"_blank">https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc=
/driver.h;hb=3DHEAD</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Jailhouse tool, which is using the ioctl AP=
I of the Jailhouse,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; available at<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://github.com/siemens/jailhou=
se/blob/master/tools/jailhouse.c" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; With the help of the above two, it looks like=
, a libvirt driver<br>
&gt;=C2=A0 =C2=A0 =C2=A0for the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Jailhouse can be implemented. Let me know if =
I am moving in the right<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; direction so far.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0From the Jailhouse perspective, it is import=
ant to not consider the<br>
&gt;=C2=A0 =C2=A0 =C2=A0command line tool an interface anymore (like in the=
 first prototype) but<br>
&gt;=C2=A0 =C2=A0 =C2=A0build on top of the Linux driver API (ioctls, sysfs=
). There is already a<br>
&gt;=C2=A0 =C2=A0 =C2=A0Python library which started to abstract this inter=
face for<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jailhouse-internal use cases. However, I strongly s=
uspect libvirt will<br>
&gt;=C2=A0 =C2=A0 =C2=A0rather want a native binding.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I have been looking at the other libvirt driv=
er implementations for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; hypervisors like HyperV and VMware to underst=
and their implementation<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; and learn from there.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0As Jailhouse is a static partitioning hypervisor wi=
thout abstraction of<br>
&gt;=C2=A0 =C2=A0 =C2=A0the underlying hardware, your starting point for th=
e libvirt binding<br>
&gt;=C2=A0 =C2=A0 =C2=A0should be a given set of Jailhouse cell configurati=
ons describing a<br>
&gt;=C2=A0 =C2=A0 =C2=A0complete partitioned system. So rather than instant=
iating on demand a<br>
&gt;=C2=A0 =C2=A0 =C2=A0domain (Jailhouse cell) with, say, a network adapte=
r, the driver should<br>
&gt;=C2=A0 =C2=A0 =C2=A0match a user request for a domain against the confi=
guration set and use<br>
&gt;=C2=A0 =C2=A0 =C2=A0what is there - or report the mismatch. What it cou=
ld organize, though,<br>
&gt;=C2=A0 =C2=A0 =C2=A0is interconnecting cells that have a (preconfigured=
) virtual network<br>
&gt;=C2=A0 =C2=A0 =C2=A0link to the root cell.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Due to this different concept, there will be no 1:1=
 mapping for<br>
&gt;=C2=A0 =C2=A0 =C2=A0commodity hypervisor drivers to the Jailhouse scena=
rio. Still, studying<br>
&gt;=C2=A0 =C2=A0 =C2=A0what they do is useful and needed in order to under=
stand what &quot;normally&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0happens and find a reasonable translation. This is =
probably the most<br>
&gt;=C2=A0 =C2=A0 =C2=A0challenging part of the project.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;<br>
<br>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS-ZpOunQC0EhfDTQaPX_ua%3DdcCccF%2BUwMoLo%3Do=
%2BROE42A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://=
groups.google.com/d/msgid/jailhouse-dev/CAD6ScS-ZpOunQC0EhfDTQaPX_ua%3DdcCc=
cF%2BUwMoLo%3Do%2BROE42A%40mail.gmail.com</a>.<br />

--000000000000f479dd05a20de024--
