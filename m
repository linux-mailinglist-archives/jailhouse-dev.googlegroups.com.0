Return-Path: <jailhouse-dev+bncBCFLNWPPWELBBS4C7TZQKGQEFFORI7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A25AB19644F
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Mar 2020 08:48:28 +0100 (CET)
Received: by mail-lf1-x138.google.com with SMTP id i24sf4952065lfo.20
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Mar 2020 00:48:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585381708; cv=pass;
        d=google.com; s=arc-20160816;
        b=uCfRwTMiP1bI4GVaB0Xbp6cL4CgO/ll1K8fbJkZ+yevXMEYbu+UjtrgYXZPrusue0v
         3lUkMZ2nkb/r22sBnOBI7Rvhd9mNqUYcyvlUQGzyoyM4N6FkRMGgrB1qaTzHDFy4jYwq
         8/498o028h5RApdZeFvDoox2joNPoRalfQCUwbCIlwUwugSA5n8hBc8x9KaUv00U1pO+
         x5VDieXikjndF/GzegWymw8FKZlrfREjhWLFgn8JH3Ouqf4KAiFkaR/xa+6fmS0eDELB
         OF2QFfNQRR9KlcR3kcZ0s5x6I6Wi2fOScJWMW/3M492j9ZRAGCMU799IJIozd0wqRHjp
         T57Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=bafV3NuFOdqfIikCPl120TYhkiyPjlUsFanEwSR8hWM=;
        b=t5UY4qXYljMWVPrcDsqW2nySRwpxLFtOxt3Tm7YBk3iOTCOqMWCcvH7jVbgSnazLBP
         COlDn5a2mykBzaqggxoxNyoNIlycpMHEY1SFpKAloDi1R7RQ3CwryV5kG3Z0zXJtWvaD
         BnqwAp8MGVS5J6Fq7lZsKnJGZFEniMCX4cPOtszGy0GrtWk+XvUH3+uYBSj91Z/Cnkcf
         pf8oH0YKuGdogqNngJFjfbFbkE/XT3sq85LAWfD2I4Z/9GZHSPqqrRyvh0deGHs9c3PN
         aCGY03UUgysdNDRtN2m8STqEoeMY2TvzA4iZiKUK81BhiibAXcvLr1Ge8u1ID0lpaJ4A
         JvGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I86AMmxc;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bafV3NuFOdqfIikCPl120TYhkiyPjlUsFanEwSR8hWM=;
        b=gmoNRr1s0kzcFxuscqUSbaXs6RjLChrhkZ7eMgKexOUUre00U76C5Y1SgPYv3zNxb9
         JVu4Q3Nu07X0xaTZiP6mVm/90se1rtXBTJOEJuuezUKVYOGtZfmZYtBAKBrB0TO4bJrI
         6FfNa9SaoQgJ9fTSZPo4WfHiO5cp21cYiAc4oE67ViDpC1InizlVVQiHl07yLUS+VI1a
         5uV3CcQWgn5uKqqXdoYcpN5lAReen90OmHd0DwydRQHdXesG8fU9N8p84ni5+CipFsMv
         y1b9QiruTXp7dC+Exo3Hqw1hsICV2fH/XJ4MkFjkhNzu9fxtGP+yHa5OPYRd0DpmmlPL
         LugQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bafV3NuFOdqfIikCPl120TYhkiyPjlUsFanEwSR8hWM=;
        b=h5g7/c8jSDJPzv75yDccfn3vwIrIsLv6DPZu7ZH+JF08HjbTicNSHcwjGHOTFh4cZb
         R41wLJjlgQE+lsqAF6u5MI84FXzckBAEg1SL4ctffmJwAQRQGyqOoQOw/hwEv3gcRv0T
         cOt4IdhDp9HeVaTmY3TIA5s4pM7Uwzi6h2C9Dk4OYxdnMSgsZY0doGl7y2LpTv+odzDb
         WegHJnmFDA4dd3pdHHbw+HXvYl8SaYB+1lpvWoweewYcCLIgEP/LATAKkVzEtrUrdgJd
         cS7qXlv71ZykAXioJDlb1Ui4G3e2itH+esewbL6cqzVS39cBbq6iR6l9R/e4cvEgob3X
         6ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bafV3NuFOdqfIikCPl120TYhkiyPjlUsFanEwSR8hWM=;
        b=sZ6IcdNSTjwjOZEePK4lgYTvvR+2aXIRZi8I4YplaD2IvtYFzUub6uM7JR4MnONTYH
         JDBnAn/YVpmEjT9JuNxMtZpltlhNlM4K8KcmTSQSPDwj4h+Otf2hM4emJUbbu8/Kq8SG
         rPtJir3F0txGK5XxrBtlurgLUrjt7RCjHTQIDxCsPaikFvQkiwaCtUappeupydMui8+s
         uQHM5IfaivtnR6zIj07ot0OorcI2ptSVnM3jZXptiVf2i2j+E1Ndqdjbub8ME9uOr7qd
         J3CbIBzcqebC1p8k/pBjvl6XyyF4H7Z5t9e95elhxxH2SKVcUOTINSI+Yhp1Sg45nQbW
         RiLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuY6lwdnArqFInhkph7jIJJJhbuoUNw0Mi9oRoetI7C73Mn6yh95
	dQCSGeY0SFRkvSV32wetbeg=
X-Google-Smtp-Source: APiQypIXdvtflcdz0wqvBt1Nwdkc9me2x2zhbBPUkeZmbF90SHhKwyBgoXKd8MBYbXUjqLse8K8SdA==
X-Received: by 2002:a19:6e0f:: with SMTP id j15mr2030350lfc.76.1585381708124;
        Sat, 28 Mar 2020 00:48:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8541:: with SMTP id u1ls2721081ljj.10.gmail; Sat, 28 Mar
 2020 00:48:27 -0700 (PDT)
X-Received: by 2002:a2e:a584:: with SMTP id m4mr1659198ljp.194.1585381707420;
        Sat, 28 Mar 2020 00:48:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585381707; cv=none;
        d=google.com; s=arc-20160816;
        b=kIfP+B8pI1RLkuG9KJPU1ZKmmFxUFzdoZSTPtRZwCDhp1m5laYBGKuFcIlXWncOME+
         jiURsQ4t1VbNtoRcjoGp/9hV9TVbMUvmKJtptTsd31OIKJ6r4QttxHypoGej3zNzEZ3x
         fksxwJZKG/VaC6aWDbv19ggQ4fcmotIva91iK9AlXgUE3iKGZJKeLpBHMup52HcVfUBF
         MchDAxQUBBbiaiMQK/TUKmqo/J/w25DtJWrzVaEjgQCgqGMSPs2wzFMWpZrRk8cFq01H
         5wpK/q/q1mAouNg0mR4UTwu6jAzPXpRP6dT4hAQrtHU0okUmp5qk8KAK0bWK91ABKLAm
         r9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rqgW17hVfvww9DAWObqnN1HODG6UYCYkTswkPOhokE4=;
        b=m4MRdMGVdqQGZEHkpUz3uc769xyrQRV/pUSFyT8+D4MKFYTJfOWdWLhQLREV/ZrSk/
         1/Hkf6uwoO+abU8xapa4skP2Nn2gRgaRnBo4pUHTgaxfQ34GRmvFNwFSxImKgWOB6o1H
         k1zZSb1fNM4E4WQo3qSeOsJQD4scqpy+eaSmKaqP9H66nxIBQaZOugN+sC7I4C404jWT
         Xh+k7/B0ScwnrgEd1WIk7TG527K7pBhq0wwshEbibfSz0sW1Tw5c0lh9Ov9UQRxR1aXM
         0a5bd90FCavKARShEvNlxQBhqBlWaf0uXPMKc9OTJA+VxFsJExFd+2KQnu9aCCSifCwT
         GXQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=I86AMmxc;
       spf=pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com. [2a00:1450:4864:20::541])
        by gmr-mx.google.com with ESMTPS id d12si435756lfi.2.2020.03.28.00.48.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Mar 2020 00:48:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of prakharbansal0910@gmail.com designates 2a00:1450:4864:20::541 as permitted sender) client-ip=2a00:1450:4864:20::541;
Received: by mail-ed1-x541.google.com with SMTP id a43so14300755edf.6
        for <jailhouse-dev@googlegroups.com>; Sat, 28 Mar 2020 00:48:27 -0700 (PDT)
X-Received: by 2002:a17:906:ecee:: with SMTP id qt14mr2654141ejb.180.1585381706769;
 Sat, 28 Mar 2020 00:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com> <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
 <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de>
In-Reply-To: <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de>
From: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Date: Sat, 28 Mar 2020 02:47:50 -0500
Message-ID: <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse Hypervisor
To: Jan Kiszka <jan.kiszka@web.de>
Cc: jailhouse-dev@googlegroups.com, 
	"libvir-list@redhat.com" <libvir-list@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007728ee05a1e571d7"
X-Original-Sender: prakharbansal0910@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=I86AMmxc;       spf=pass
 (google.com: domain of prakharbansal0910@gmail.com designates
 2a00:1450:4864:20::541 as permitted sender) smtp.mailfrom=prakharbansal0910@gmail.com;
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

--0000000000007728ee05a1e571d7
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

Thanks for the reply!

I was only considering the command-line tool "code" for reference to the
Jailhouse kernel API(ioctl calls) because I didn't find a documentation of
the Jailhouse kernel APIs.

For the second part as you mentioned that Jailhouse can only create cells
with the constraints defined in the root cell configuration. I have a few
questions regarding that.

1. Is there a way to know if Jailhouse is enabled on the host and get the
root cell configuration(s) from Jailhouse through an API? This can be used
while binding the libvirt to the Jailhouse hypervisor.

2. If Jailhouse is not enabled(again can we know this using some API) then,
can libvirt enable/disable Jailhouse during the libvirt binding of the
Jailhouse driver with a given set of Jailhouse cell configurations
describing a complete partitioned system?

3. I was wondering, as you mentioned that libvirt driver should check for
mismatch of the cell configuration with the root cell configuration, the
question is, isn't that done by Jailhouse itself? If yes, then libvirt can
just pass on the cell creation requests to Jailhouse and return the
response to the user as it is, rather than driver doing any such mismatch
check.

-Prakhar

On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka <jan.kiszka@web.de> wrote:

> Hi Prakhar,
>
> On 25.03.20 05:36, PRAKHAR BANSAL wrote:
> > Hi Jan,
> >
> > Thanks for the reply. I looked deeper into the libvirt and Jailhouse
> > source code and found following two things that seem relevant to the
> > project I am interested in.
> >
> > - Libvirt driver interface at [libvirt.git]
> > <https://libvirt.org/git/?p=libvirt.git;a=tree;hb=HEAD> / src
> > <https://libvirt.org/git/?p=libvirt.git;a=tree;f=src;hb=HEAD> / driver.h
> > <
> https://libvirt.org/git/?p=libvirt.git;a=blob_plain;f=src/driver.h;hb=HEAD
> >
> > - Jailhouse tool, which is using the ioctl API of the Jailhouse,
> > available at
> > https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c.
> >
> > With the help of the above two, it looks like, a libvirt driver for the
> > Jailhouse can be implemented. Let me know if I am moving in the right
> > direction so far.
>
>  From the Jailhouse perspective, it is important to not consider the
> command line tool an interface anymore (like in the first prototype) but
> build on top of the Linux driver API (ioctls, sysfs). There is already a
> Python library which started to abstract this interface for
> Jailhouse-internal use cases. However, I strongly suspect libvirt will
> rather want a native binding.
>
> >
> > I have been looking at the other libvirt driver implementations for
> > hypervisors like HyperV and VMware to understand their implementation
> > and learn from there.
>
> As Jailhouse is a static partitioning hypervisor without abstraction of
> the underlying hardware, your starting point for the libvirt binding
> should be a given set of Jailhouse cell configurations describing a
> complete partitioned system. So rather than instantiating on demand a
> domain (Jailhouse cell) with, say, a network adapter, the driver should
> match a user request for a domain against the configuration set and use
> what is there - or report the mismatch. What it could organize, though,
> is interconnecting cells that have a (preconfigured) virtual network
> link to the root cell.
>
> Due to this different concept, there will be no 1:1 mapping for
> commodity hypervisor drivers to the Jailhouse scenario. Still, studying
> what they do is useful and needed in order to understand what "normally"
> happens and find a reasonable translation. This is probably the most
> challenging part of the project.
>
> Jan
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAD6ScS9oSd9%3Demq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ%40mail.gmail.com.

--0000000000007728ee05a1e571d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Jan,<div><br></div><div>Thanks fo=
r the reply!</div><div><br></div><div>I was only considering=C2=A0the comma=
nd-line tool &quot;code&quot; for reference to the Jailhouse kernel API(ioc=
tl calls) because I didn&#39;t find a documentation of the Jailhouse kernel=
 APIs.</div><div><br></div><div>For the second part as you mentioned that J=
ailhouse can only create cells with the constraints defined in the root cel=
l configuration. I have a few questions regarding that.</div><div><br></div=
><div>1. Is there a way to know if Jailhouse is enabled on the host and get=
 the root cell configuration(s) from Jailhouse through an API? This can be =
used while binding the libvirt to the Jailhouse hypervisor.</div><div><br><=
/div><div>2. If Jailhouse is not enabled(again can we know this using some =
API) then, can libvirt enable/disable Jailhouse during the libvirt binding =
of the Jailhouse driver with a given set of Jailhouse cell configurations d=
escribing a complete partitioned system?</div><div><br></div><div>3. I was =
wondering, as you mentioned that libvirt driver should check for mismatch o=
f the cell configuration with the root cell configuration, the question is,=
 isn&#39;t that done by Jailhouse itself? If yes, then libvirt can just pas=
s on the cell creation requests to Jailhouse and return the response to the=
 user as it is, rather than driver doing any such mismatch check.</div><div=
><br></div><div>-Prakhar</div></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 26, 2020 at 1:49 AM Jan Kis=
zka &lt;<a href=3D"mailto:jan.kiszka@web.de">jan.kiszka@web.de</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">Hi Prakhar,<br>
<br>
On 25.03.20 05:36, PRAKHAR BANSAL wrote:<br>
&gt; Hi Jan,<br>
&gt;<br>
&gt; Thanks for the reply. I looked deeper into the libvirt and Jailhouse<b=
r>
&gt; source code and found following two things that seem relevant to the<b=
r>
&gt; project I am interested in.<br>
&gt;<br>
&gt; - Libvirt driver interface at [libvirt.git]<br>
&gt; &lt;<a href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3D=
HEAD" rel=3D"noreferrer" target=3D"_blank">https://libvirt.org/git/?p=3Dlib=
virt.git;a=3Dtree;hb=3DHEAD</a>&gt;=C2=A0/ src<br>
&gt; &lt;<a href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Ds=
rc;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">https://libvirt.org/git/=
?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHEAD</a>&gt;=C2=A0/ driver.h<br>
&gt; &lt;<a href=3D"https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain=
;f=3Dsrc/driver.h;hb=3DHEAD" rel=3D"noreferrer" target=3D"_blank">https://l=
ibvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc/driver.h;hb=3DHEAD</=
a>&gt;<br>
&gt; - Jailhouse tool, which is using the ioctl API of the Jailhouse,<br>
&gt; available at<br>
&gt; <a href=3D"https://github.com/siemens/jailhouse/blob/master/tools/jail=
house.c" rel=3D"noreferrer" target=3D"_blank">https://github.com/siemens/ja=
ilhouse/blob/master/tools/jailhouse.c</a>.<br>
&gt;<br>
&gt; With the help of the above two, it looks like, a libvirt driver for th=
e<br>
&gt; Jailhouse can be implemented. Let me know if I am moving in the right<=
br>
&gt; direction so far.<br>
<br>
=C2=A0From the Jailhouse perspective, it is important to not consider the<b=
r>
command line tool an interface anymore (like in the first prototype) but<br=
>
build on top of the Linux driver API (ioctls, sysfs). There is already a<br=
>
Python library which started to abstract this interface for<br>
Jailhouse-internal use cases. However, I strongly suspect libvirt will<br>
rather want a native binding.<br>
<br>
&gt;<br>
&gt; I have been looking at the other libvirt driver implementations for<br=
>
&gt; hypervisors like HyperV and VMware to understand their implementation<=
br>
&gt; and learn from there.<br>
<br>
As Jailhouse is a static partitioning hypervisor without abstraction of<br>
the underlying hardware, your starting point for the libvirt binding<br>
should be a given set of Jailhouse cell configurations describing a<br>
complete partitioned system. So rather than instantiating on demand a<br>
domain (Jailhouse cell) with, say, a network adapter, the driver should<br>
match a user request for a domain against the configuration set and use<br>
what is there - or report the mismatch. What it could organize, though,<br>
is interconnecting cells that have a (preconfigured) virtual network<br>
link to the root cell.<br>
<br>
Due to this different concept, there will be no 1:1 mapping for<br>
commodity hypervisor drivers to the Jailhouse scenario. Still, studying<br>
what they do is useful and needed in order to understand what &quot;normall=
y&quot;<br>
happens and find a reasonable translation. This is probably the most<br>
challenging part of the project.<br>
<br>
Jan<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAD6ScS9oSd9%3Demq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM=
7sQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAD6ScS9oSd9%3Demq3ywSTEng2EwWj1AoBsYQhiz=
EuSP8osMM7sQ%40mail.gmail.com</a>.<br />

--0000000000007728ee05a1e571d7--
