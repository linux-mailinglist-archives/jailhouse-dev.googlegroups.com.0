Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB5NJ7TZQKGQE32H5M3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8731964B1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Mar 2020 10:12:22 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id c20sf4985842lfh.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 Mar 2020 02:12:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585386742; cv=pass;
        d=google.com; s=arc-20160816;
        b=JedqCkM27XjLU9MS2meAjByyioIJDEY79GvKICm1qn6LbdETXfLZQikgMUt+1mDwJ4
         Kfjw7XBJNBKHx+BCzD7A42xbnuFr7n2dg+/kjkheHghHETWFoqo63RzNzPeHaJADAfsE
         /taJdjeqVOaHqY0sFe0u9Ky4nOW+mp8tZ56Cm2NSr9KEsNEaG+vIwc5eFJZ88SVZmQLR
         Kn//Cy4Lnn6RE7fVkvFkQUtjO5kelRZ5m7ygQzyhzQbtfoqJA9s/n/k85uGLRZ5AK7YL
         Jh0t9qHtFb+4wMRyqzwKQb1D4ifgQeLwK7n7Noc7jL/l50a/h03W52CKl7jAg6UpVzi1
         uHnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=QtqW4x4LUAM8Er9Q1mGBDu8ecERYfIOQDT1ZPcC7GuQ=;
        b=yDilW42n0GOHnmzA23L+hpJXVRm58h+Ab7Wp+075fc0d/ojn+ayyV59GeLQoT4M9kX
         YntUEPsGA4LdftHVwAYpj0TFZkrKPS1yg0gIMoOKpZ2R0YJ8pxAcgWv3LR9anqj7ZAIU
         8zIRi0mV1+3rC1yYRbagLrYyZrflo0zE865uZnwp4ir8PQaOEUq8bFHZ9268B/pmmZkd
         Go94YtzkFigyALCR96MdwoDn7dnRvkv9UrP53AmTsWGuaovWvtzQE9F9ayQoZa1B4nNb
         Y2Doz/VmTPHFXO7i5j1qX7k3CJC7Mcp17xfT+pwgLoynmf09gS54jMBMwjCc2gf08Ve8
         5ZSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nvYrTwQc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QtqW4x4LUAM8Er9Q1mGBDu8ecERYfIOQDT1ZPcC7GuQ=;
        b=PMSc9+Iq743eWrO92O1Gz96DDHpKUFNfuTFJga1oLOps4W8vphiZ92/Gh6nMV6BHB4
         FikqYrpiUM8a5KlgPAwXjRAHQIInwBeCMGVNZGO1Nxz/SNJ8L0vOUMERenjdb6RnoKJf
         yKeSAsBZoPWtQyEl3qFAxZT5/JTb9KurByZsyzAP+gnic5ldGCZ2naWGLh9Xe/ZeomPo
         Ad3AfuimEQpFxT7iaMS/9HuxFrpI7A1CmvRmckiCzfxnzWYs8n7Mk+G2dqc+Lwge5CR+
         AwAnkUpZ/mbWWcFJFunk3Q+NT9im2mn9sVSljm5L9hhhJgVheKUdP/GXaoABnf6whoU+
         +tPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QtqW4x4LUAM8Er9Q1mGBDu8ecERYfIOQDT1ZPcC7GuQ=;
        b=qU2JkkDsBB+omAl0WA/hl94O4/nNv+7fxIEJycyhpoEIyHV1aiHc1zIbEc6hdKGAFa
         Kg3N+lSVLI1QKSvzv152dertVF0z65rHuZsh2VJIYOAiOjgKdzgOLGvbj77vva/9JjjM
         DZ5MzNTaAI5nHOUmJrH6LtoeoTJLd+SxEUohWhvf8nEjKA24X8dTXfG4+oUvPsnj68p1
         tE+4lvIDsFuWs7XYZETdBF5olPKu2Iw8Yw4JopIW32VlB6Kj5qdZ8Sej9mjnuLWPuDhN
         E81b+JU7mE8itewRq3jXfzZ15CfUWFWKaQmhT0UJUQHS/MKIX5fLT1QYE3POa5LgwyKN
         u8Bg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Puap3sK9xTsFFDqbjT5DqIKdUN0wx9MAppQTplk3EYd53OkHvOt+
	wvEZuEtkG1jeeXFDJXjhomY=
X-Google-Smtp-Source: APiQypLZmvS9IUGfCtJgQ11EfKIVHqd9RYt54v3fhMrtB7CF5p76G3FHrhv9qa3lxJXs84wbiehyLw==
X-Received: by 2002:a05:6512:202d:: with SMTP id s13mr2184040lfs.19.1585386741943;
        Sat, 28 Mar 2020 02:12:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4d15:: with SMTP id r21ls2127512lfi.0.gmail; Sat, 28 Mar
 2020 02:12:20 -0700 (PDT)
X-Received: by 2002:ac2:5212:: with SMTP id a18mr2218994lfl.36.1585386740120;
        Sat, 28 Mar 2020 02:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585386740; cv=none;
        d=google.com; s=arc-20160816;
        b=iUijOmIrClbboD+YPZ4xiUGYQ3N96p9BR7BUvd4UpQvdm4/qgGhKEdhphaAmdbxjhg
         VOv2gp346U6pmLtSI8uZCJ6zPnIa6QBsCID6E0p1CRai2AlDzPMySFkcrVaDd6zf2QVH
         KaeREVqzbyXa+Wq0k4OMKgUADG2V3wSsUxqMMI7rtgrdVwY5RerBhX8nxiNWGLtsXUoj
         0Kdu3818pK2zh6C8OMY6yO7LXmUTEuPpYbex4COJlZIsKCPMa9UyHM4/MpMza8fQWPPb
         bzAQsKmqtXf/DhclUzmscARLfa0uRoInpBNVe8RqloSDAM0RgQLfoXbw/pvyHCdU/L0p
         ImRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cHnYcKshk6tiC8iwJbWrJH/ZDa8eOd02seTiPm07QJ8=;
        b=W6O8JQsqBG6ZENReBlK8j4omdtYJff2PBdBpfhAFPDyTbSpF/yfNnITsmXmdrRapsK
         iPjVx5G3r4rsCtecnFpRV6DOBdXA393Fc5+VYxrB9iL6GmuCRr/HMW0UD5R/Eeh2i1Ua
         86N7Af4/EA/RhIxR5k1sJmQKCbFaYM7rcmkWUsiIGv9p1U/0x5ZnnIovU12tms4ATIZC
         JKDIdYegHq2jM4fgBkxenTGrXP7zKGjzLwMcskRqOnjxRlU8X4lTRQhW/hWN5yKMJibf
         HQONMh05aghG5jqehMA66sSnmFI7jZj1/vtqRKYx/ckRt91FQwdXTUCAg2qpQQzcb4Wf
         Tkqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nvYrTwQc;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id p5si488166ljj.3.2020.03.28.02.12.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Mar 2020 02:12:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Mgwhg-1iwAmA3MKu-00M6wq; Sat, 28
 Mar 2020 10:12:18 +0100
Subject: Re: GSoC'20 Interested Student: Adding support to Jailhouse
 Hypervisor
To: PRAKHAR BANSAL <prakharbansal0910@gmail.com>
Cc: jailhouse-dev@googlegroups.com,
 "libvir-list@redhat.com" <libvir-list@redhat.com>
References: <CAD6ScS9OfG2T3_YBUG8sRMHGVQyFvDwfm_wGtz880yTpBdfygQ@mail.gmail.com>
 <6557f1be-cce8-21c3-0b76-c78901acecda@siemens.com>
 <CAD6ScS86TxG7yk=EzQWV1UiAiEnJaJxWar6Bi4yzbBW+So9hKA@mail.gmail.com>
 <a0c156aa-f87d-e5ea-d3c3-7b7929c503c4@web.de>
 <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de>
Date: Sat, 28 Mar 2020 10:12:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS9oSd9=emq3ywSTEng2EwWj1AoBsYQhizEuSP8osMM7sQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:H82VwFU06es+f7w1Ykxj9hoa+pkaaqRqtJGBJiy/DHKGIZazcfU
 ViVUrT/uQWMVmlXzMljPb8tVBQViVWClqT3b9AZniUDJE506b39OQSgCD2JFH7MdHhfQrZe
 aITr0B3LUWNyGo0N3blugBojkN/DM7GUyCa2bHKhiFOQA27wrsVkJCpcwN3Jr9JyyOxmtdh
 tRZ//Tzkr95V/Slr8CqGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iDxu/VRnGbk=:lFp9b692WO8+iyoH1qgXJs
 wHuDlLVkxJ36jtXz7TcrcPIj6r9oRwHdNBx3mTci8MejJBDWxYfthP6+0GRPqUO6yudIMXyZl
 bCuAhDJfz6IDMb0SgmOCaPDRZtU/zDGlLbzqic9dW003EMbVzC1dE1XV837LAMU6Qp8YpM7p7
 k+Gedw+sUe9FJ2A+tKXyKcRVbzzmtdKwZCfYnT8iyCDJXHQBdeBOUCPbhOavDyZSUdRVLtzwk
 lKinDeeNhftLK5mv4I8l4MG4lZyTeKIW8u4V3Z02b9Ku5XFFxQVjG0J60yZd6kE00JovfLVVO
 z7rNNaRX+SIJneT+oYYJgbKDxlo5XRfrNt59z+WtHBIYcH8CTUFHuD/DGyHAwgE7RPhabYeGw
 xNp6tpUeLAS20YWHu8sau28raOfl5gCg3hGcneLA1dELOBL5YFCvM7XFhKwrtXzgn+Gv42zNi
 OQNKvdHlrvM2EXeobIQogNLXKpqSZrWyTCo+hhIfhjU1d6jH34DSsnNILT3lk3hKW2ugp0i/U
 2Qmy3U59EuYzQgWo9i8ebsDvwijKgU4xQVTb5ZQ3a+ljuME840AOWqDbuysJ1hyCDAr5GeCRN
 NoXZzr9gTS6b/AL3lkGCIMUEu8ejxbTz1mcMglyXjC7Ssh3gryDa6Cw73WS7seNlWdOF4fWaQ
 s4ZuKHxOfMVZNcTJ+NXI5jIJaxGhCqV9cFHKXAY+uDi/j6rAK+MxmsP0vwggA8LUdjx6nbGF2
 yrfhSVMf2c5VOJcx2P+uIAnMBbBYxW6+/+YI4Quv1US8XNtiP2yat8wnFFMy6hKq32QbkpPQ3
 itXCpLgLsTMiJHu00L/SmUWmNsXMMwu+rG+TOIiu0W9oAeEBVoI/sUPjCJyiQtgUW28AfF4d5
 x5Y73nZRJhJLJsNRpEMpNXYR4ZJDaGcj7y8HB2T6zSDl/aeCQv/1OOgCJy0kPaWp7FIcKtzDC
 G2lI4HtoQQzhRro87Xf1Ykmz9V4wVRDH3CKjgF9OXhcTCvK36HB/o4V86/yxcPNG0hr9wgDKf
 pbUxVrd0vxU8UgapEJEPzzeQa3fTn3/aZQ9FjmLwiRaQe7yz7v8GrxoiXsMjVJIYtPdQVB71s
 DnONQL4zoPEoYmf0p1A8A3HsJo2sz1Dz71vPRn/EjVBw4m7AobkX0jDlpAetDBOh9nyCKmHcK
 f39htFTPr0WMWYkvuiWRG8v5BeO9IhcS2DOJ72+AtjVZwDEwQqVXe9Jy2ZEoBhvqDSZl7oDUm
 Z1zkJ1pr0Gq87vXeS
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=nvYrTwQc;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 28.03.20 08:47, PRAKHAR BANSAL wrote:
> Hi=C2=A0Jan,
>
> Thanks for the reply!
>
> I was only considering=C2=A0the command-line tool "code" for reference to=
 the
> Jailhouse kernel API(ioctl calls) because I didn't find a documentation
> of the Jailhouse kernel APIs.

Right, the IOCTL API is not documented so far. It is currently only used
inside the Jailhouse project. This needs to be formalized when there
shall be external users like a libvirt driver.

That might be a nice small contribution task: Create some
Documentation/driver-interfaces.md that describes the IOCTLs along with
their parameter structures and that also includes the current
sysfs-entries.txt as a section. Then send this as patch here. I'll help
out when details are not clear from reading the code.

>
> For the second part as you mentioned that Jailhouse can only create
> cells with the constraints defined in the root cell configuration. I
> have a few questions regarding that.
>
> 1. Is there a way to know if Jailhouse is enabled on the host and get
> the root cell configuration(s) from Jailhouse through an API? This can
> be used while binding the libvirt to the Jailhouse hypervisor.

Look at
https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-entrie=
s.txt
for what is reported as runtime information. Full configurations can't
be read back at this point. This might be reconsidered in the light of
[1], but I wouldn't plat for that yet.

>
> 2. If Jailhouse is not enabled(again can we know this using some API)
> then, can libvirt enable/disable Jailhouse during the libvirt binding of
> the Jailhouse driver with a given set of Jailhouse cell configurations
> describing a complete partitioned system?

With the API above and a given configuration set, yes. The config set
would have to be provided to the libvirt driver in some to-be-defined
way (e.g. /etc/libvirt/jailhouse.conf -> /etc/libvirt/jailhouse/*.cell).

>
> 3. I was wondering, as you mentioned that libvirt driver should check
> for mismatch of the cell configuration with the root cell configuration,
> the question is, isn't that done by Jailhouse itself? If yes, then
> libvirt can just pass on the cell creation requests to Jailhouse and
> return the response to the user as it is, rather than driver doing any
> such mismatch check.

With matching I'm referring to a libvirt user request like "create a
domain with 2 CPUs", while there are no cells left that have more than
one CPU. Or "give the domain 1G RAM", and you need to find an available
cell with that much memory. Those are simple examples. A request that
states "connect the domain to the host network A" implies that a cell
has a shared-memory link to, say, the root cell that can be configured
to bridge this. But let's keep that for later and start as simple as
possible.

Jan

[1]
https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-=
BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com

>
> -Prakhar
>
> On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka <jan.kiszka@web.de
> <mailto:jan.kiszka@web.de>> wrote:
>
>     Hi Prakhar,
>
>     On 25.03.20 05:36, PRAKHAR BANSAL wrote:
>      > Hi Jan,
>      >
>      > Thanks for the reply. I looked deeper into the libvirt and Jailhou=
se
>      > source code and found following two things that seem relevant to t=
he
>      > project I am interested in.
>      >
>      > - Libvirt driver interface at [libvirt.git]
>      > <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD>=C2=
=A0/ src
>      > <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;f=3Dsrc;hb=3DHE=
AD>=C2=A0/
>     driver.h
>      >
>     <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Dsrc/driv=
er.h;hb=3DHEAD>
>      > - Jailhouse tool, which is using the ioctl API of the Jailhouse,
>      > available at
>      > https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c=
.
>      >
>      > With the help of the above two, it looks like, a libvirt driver
>     for the
>      > Jailhouse can be implemented. Let me know if I am moving in the ri=
ght
>      > direction so far.
>
>      =C2=A0From the Jailhouse perspective, it is important to not conside=
r the
>     command line tool an interface anymore (like in the first prototype) =
but
>     build on top of the Linux driver API (ioctls, sysfs). There is alread=
y a
>     Python library which started to abstract this interface for
>     Jailhouse-internal use cases. However, I strongly suspect libvirt wil=
l
>     rather want a native binding.
>
>      >
>      > I have been looking at the other libvirt driver implementations fo=
r
>      > hypervisors like HyperV and VMware to understand their implementat=
ion
>      > and learn from there.
>
>     As Jailhouse is a static partitioning hypervisor without abstraction =
of
>     the underlying hardware, your starting point for the libvirt binding
>     should be a given set of Jailhouse cell configurations describing a
>     complete partitioned system. So rather than instantiating on demand a
>     domain (Jailhouse cell) with, say, a network adapter, the driver shou=
ld
>     match a user request for a domain against the configuration set and u=
se
>     what is there - or report the mismatch. What it could organize, thoug=
h,
>     is interconnecting cells that have a (preconfigured) virtual network
>     link to the root cell.
>
>     Due to this different concept, there will be no 1:1 mapping for
>     commodity hypervisor drivers to the Jailhouse scenario. Still, studyi=
ng
>     what they do is useful and needed in order to understand what "normal=
ly"
>     happens and find a reasonable translation. This is probably the most
>     challenging part of the project.
>
>     Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8c54c380-92e7-046c-33e1-4c88a3446bfb%40web.de.
