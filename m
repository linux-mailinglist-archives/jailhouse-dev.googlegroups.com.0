Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBD6PRP2AKGQEC5TTT4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id CD360198C82
	for <lists+jailhouse-dev@lfdr.de>; Tue, 31 Mar 2020 08:47:43 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id u8sf3308692ljg.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Mar 2020 23:47:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585637263; cv=pass;
        d=google.com; s=arc-20160816;
        b=DeuoB85ApCTujX18GnC4ZsMcVTs2Km707avf2DHZPkH2u2eTJYEfsg4Zo+T7Ex8zpV
         uVcvC5LTDcwXSgCt0zo3iZmPPUeiJqOtVvmQmk4YmSIVYDQb+JgZ/gd17TYPKXpwl9aL
         C+t88v32xH8IIo2qG8/ccdxBEolmv7UbYsFHBrNJ0xQjf1w/tBPiZjKbh2NuL5t4BBHf
         UjS+gNKogS7P4IXITiB1qx3RDT0rUP/6jmDpUKC1hy0ezq67Bd/VG0GWhPheZ5z7gGyx
         XA6Wl3cXljz8nVO7IASn+cdIp1X5+Dja3yEYxAtdsy357MeLvxPbI4ai5oE5ZaFfn3zo
         JM0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=XzHPnAAWsJjimkpBOQ1gJrcvQ2W47RO17iSvwM3VDGY=;
        b=cyqX/orSjLHlR3X6aATdzIVKIEe1ShgCL3ixKZ3Z2A2L3US8WlHd0lOez+6MpGkZAG
         TDtvH9CkJo/DqnxZ/o6zAiWqWzpnDKpwCT5rbTuh/CNTrqshO4i18fcsxUbD5B0E9132
         PwNa+E+4pa0LwaQtPmI3tLDhwr9LEXPQW7Eyjb6cl8T7RebySVtd01cLPkqqLVCOvSOG
         mxqaU44JLBdhThYwMDHwu0HConl17ZkGxZth/Od9Q2rlrQ7sco/w9EjPTlbGsCKuXi1G
         iHupMUntZ++RwkimxalT42Hg4A7Rfhik4dg+4QSu1iruCuoEDRf35/LWHF3pJgF2LkDP
         Z7bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=P0pYBB+n;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XzHPnAAWsJjimkpBOQ1gJrcvQ2W47RO17iSvwM3VDGY=;
        b=ggZp5iEy/5ada+mlMIrnS1k/3iC3AtISDUCU0FLnEhdU5qRuz2Ef5QCX3ThreGOmjT
         EIKRw+kI1qlWxU8zOg8+8QWb8hNsVU1osccm5tm4gZJnjjaIGRX1qp3JTSTIcpYM/zVt
         j4cv7YxRwutkWDLKyhgmiOTcO+aHX/CJ51XykyWJD8dBHBEd2Rf/kSBG8w/L7DBixc4T
         9/HdDFT4XLPppo4pVmPVdK7meczT9J4rsHum4sKVvDHiNhoYfDN3NADxME1KVNSvgvHZ
         aeu1FaqrbRvaO10R/QtwtON4Q/8pWbFanch9XKVHPdGQB3PefjaRvyHoIKDZGJ4B4Kom
         pn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XzHPnAAWsJjimkpBOQ1gJrcvQ2W47RO17iSvwM3VDGY=;
        b=HPZsz29k8vFQ8AU5xchORxkjizEthxp/DeZ2p+385OGas07QQiwPlPAD15M2HvBxhX
         Uxy37AIySCM0xDtdTaLYfZXTt7DhwzSIiXCEf4Z0Q1+5OUCgm8gG0wVYjEj1Ij8jhOJW
         1ObO6Hu9HITMGwU4sW4ZAO6ee2VFBlqrY1HrQI1dxkgWaAxXN/RCOGRh2p7Fzw3R/noQ
         IMqGm0bDU3wDYg/UNfk39Xx6QHm2jmGBb9BvPetBntldrM5Xw0p+E7YWU+1vLeetVGJa
         70dtbjLBB5cyB81zPcEVg/RP8LtiyxzfMCeBXw4EuYWVSHr9Rk3CSWoNdkqE/qKNaH0m
         wRNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZBQucebrkVh0kEWLZrpnEfEk+o8ePU48nJCLED9Mr4y2yRWF/W
	dbMDbs442sA3KOFDjSlKPBY=
X-Google-Smtp-Source: APiQypLd3xXRtH4xBM9HHbhfs+bPIuSaDIJB2kByYA9kzl1U+ODfFRGtt6+1Jh6kOXtGQ7TJPLJHCQ==
X-Received: by 2002:a05:6512:443:: with SMTP id y3mr9851651lfk.166.1585637263262;
        Mon, 30 Mar 2020 23:47:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4897:: with SMTP id x23ls2159076lfc.3.gmail; Mon, 30 Mar
 2020 23:47:42 -0700 (PDT)
X-Received: by 2002:ac2:5146:: with SMTP id q6mr10613771lfd.81.1585637262468;
        Mon, 30 Mar 2020 23:47:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585637262; cv=none;
        d=google.com; s=arc-20160816;
        b=kecex75wLyTFAtg1RvO2T904SjyRMVkYhxRJHO0KRdbixjvLD+VEtZA8pmLi7AbiSL
         z3xKOQQdFZEgaoH2BuGWBSum4PO5elhsK8ozfFWBn31QBmZ5KYFBLMLCuI6zJoDF3XgV
         PQQGWSXzN7xy0J1sCwo4xgQGMGSJp4gkVMfVjrzQEwlncM8YRqsHfGDpXFWgX8IJTre1
         aJecaS28ggnAa2hHkHQBOYHu/xiUbmEvdNNY5pXetHBpo006bMREe6PU58Z7Sy16CbGY
         no9eGjLAGVWfXw9bl3gNQVieEIa/DZbHz5V4x+kAuA/4HMYCZlYIoDelX63hM0nP/m73
         a1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Rsb8DuEvLnnOZAViah0N1cO4S6q5VhlOTgrCaM3xA18=;
        b=heKJ5qTYbBXlD+jL78uFqF+OwxG8gM4wq0w9nUqZHYThreVk1077GXWP5Siy2HqaP4
         3SLWRBKU7uWmgyyhN+/OJ3F6ebI7gIRM+lOc8eLgpgacL2UrzBzljRZv6lZXSrc7KxfV
         39hLNO3flUoXvY95/qWfQROrAa11RF83WZ0iWubQo2/fdDGU8nfzcRPeZ9C/Pbh8rFi9
         J9Tal0Ll/AU+zjVBpFrg+LzElaZeEU1pD0OsbTckCw48rJ2WPzLOn4E5m8i9fBzeNqGN
         o/oaRTsgWlWs6cbA0D7yWEpFdhl6vzdbCRsW6W3RpKzznG19grI8PhR+b4HGVhxst0EK
         vN/A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=P0pYBB+n;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id u10si251038lfq.1.2020.03.30.23.47.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2020 23:47:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LoHgL-1iqjci0bOr-00gG8w; Tue, 31
 Mar 2020 08:47:41 +0200
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
 <8c54c380-92e7-046c-33e1-4c88a3446bfb@web.de>
 <CAD6ScS-ZpOunQC0EhfDTQaPX_ua=dcCccF+UwMoLo=o+ROE42A@mail.gmail.com>
 <990fc418-0b4e-b2b2-8963-af350a8c516c@web.de>
 <CAD6ScS9MgX8LQ0GTLhDzyNv13xa3=z7DgfzCX3c9nEqKz4e0Wg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <2955ec65-f973-694a-a5fa-5f3a08243e2c@web.de>
Date: Tue, 31 Mar 2020 08:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS9MgX8LQ0GTLhDzyNv13xa3=z7DgfzCX3c9nEqKz4e0Wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qre5AwsAtlj7qNdaWexXNOWJkhLnkdmLqpAbWvhDIH4B+DE2bdX
 3un7X/t8HkxuLmDdjEPGirrHu/n3DCwQP9lOuaRzNMtlwbqDoGn4O22nlI3S3DxQccUkiIa
 kI2aZC8ZDBI9lugFTpB7723IfnsJ9JKMSMhma/F35GRRzkxaYzBP1zq4F1csBPawj9ersTw
 yYwvFf6U4py8RbUxukhwQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EeYi7j0GUi4=:vuEFDYpZNAfZF/13/RXcVL
 u8C6G/IfPMGwKIorUtUhg8VKkNXNVJWS8eobE5a/wIbPN7Nbm+l9PFK9339H/udpo//emllGL
 If7tn55q39HQ8RDqtNi0wFmgwWxiVf9w484wak8Tx/Waqf9bweoFPML0UK5xrm3GdmmSDaPYU
 58lNYg1F9VYw9rXwkjNdzTOyiAKWi4Sc7hAaAxu/Zs16BCXNqxU5y+E86zVNZOdThhWC/1yf8
 tCNIURNYbQQq2HnbPOD3jUk0udQhTGhmdp3R1t/fdSxWayp2tvBxn7NpfyF6Cr4TEyROlrMUG
 hCkIUTvA5Kk+cUjdxzDcUgv8H1BNRQuUDCdSgTJWXCZDbLj+F0HokgKFBiJ3EsuDsvtAqzMfT
 N8eJBrOpU+sT1W0Krvz2f777pjdVPHowICaz55xT3izwlE1brg5A6JMkTCKOYZeUHls5OHIT8
 uhcw7rlQci2lN7aj66GsXe1CGqsXmFeK7XAAdOubh+GhrfHR0uQ+V0gpfDoGU8zDqAQycc6Bq
 waRGwx5jRMtL5yl3AKA88BJlX/cFFGvCvvh/Wt1in330G4jkgelZME/pdXtccrMqfolTCPa3m
 l21dm93zSIKcEwiquuTwtSVUxUp3KubRZotlhHb2j4ad9sb7GUSuSaYtGYfogvHTNpLfTzJnP
 2mM33isLzB+rOOCJ3RNjdyVYXJhPkwwQQUug+fPjWAeLcLyuraVwpATFJ3uQQ5ODXUHWelLru
 h2HcZ95p1yDMumeAjPUM8O6Gu5po3Puj/qZEdqQPG/G5CgdWPkOmSRr6gk8ZS6IlftF2Yn+VL
 dBALhNv+GorMPriRIPmHArmofpaanc3rRUeCEBQg+eXBx8evgclAy59SmJkKGPbyugKXFBlZ4
 XluUN/oYQC4VFg1dClcz4Nnv3jDuLnG/qH7Yg+XxLiTKF0O3XaylKpxBXJz9A6PSxOvRSZC5J
 hcZ5+a0swCjfbkk3g51rxdGQ2Snuf/fx60ASRjbOa2wjWKsCxHtFE9+eqkKByZsWVFxbCdP/N
 +UF/TqWUbex+2qcm+GPCkVxfEUeWHTBRChjetyyg0UKyIoX2Mj9yFAoMT7r9lZpIGAdUlDkrQ
 p6Ufbz0pZXb2WuSfvOLOng5EGa6W6hFXHlXH9XQupYzuQr8Ru3fdJTOOgIBzzjSs2UhbeavAV
 PycQEccGdFDZuF+BNDxdIx8uu/6qN27xLmZuZmIa9zIFYWCRZYn2EdGfbSHIrvmodAw52IIvU
 h3iWEe//DPOyFO0OV
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=P0pYBB+n;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
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

On 31.03.20 04:43, PRAKHAR BANSAL wrote:
> Hi=C2=A0Jan,
>
> Thanks for the confirmation to proceed on project proposal.
>
> Also, I tried installing Jailhouse on my VM after enabling VT-x/EPT and
> IOMMU for my VM(Guest OS- Ubuntu 18.04) on VMware fusion hypervisor with
> MacOS on the host side.
> However, =C2=A0Jailhouse hardware check was failed because of missing
> *Preemption=C2=A0timer and Virtualize APIC access*, could you please sugg=
est,
> if this is hardware limitation?=C2=A0 Is there any workaround=C2=A0here?

You will need a hypervisor that supports both when nesting, but I have
no idea if there is one for the Mac. What is known to work is KVM on
Linux hosts.

> My laptop's processor is Intel quad-core i7.
>
> image.png
>
> Also, could you please suggest, if I can talk to you through an IRC or
> slack channel since it is a bit hard to communicate over email every time=
.

I'll be listening on #jailhouse, irc.freenode.net.

Jan

>
> Thanks,
> Prakhar
>
>
> On Mon, Mar 30, 2020 at 6:15 AM Jan Kiszka <jan.kiszka@web.de
> <mailto:jan.kiszka@web.de>> wrote:
>
>     On 30.03.20 10:02, PRAKHAR BANSAL wrote:
>      > Hi=C2=A0Jan,
>      >
>      > On Sat, Mar 28, 2020 at 4:12 AM Jan Kiszka <jan.kiszka@web.de
>     <mailto:jan.kiszka@web.de>
>      > <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0On 28.03.20 08:47, PRAKHAR BANSAL wrote:
>      >=C2=A0 =C2=A0 =C2=A0 > Hi=C2=A0Jan,
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > Thanks for the reply!
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > I was only considering=C2=A0the command-line=
 tool "code" for
>     reference
>      >=C2=A0 =C2=A0 =C2=A0to the
>      >=C2=A0 =C2=A0 =C2=A0 > Jailhouse kernel API(ioctl calls) because I =
didn't find a
>      >=C2=A0 =C2=A0 =C2=A0documentation
>      >=C2=A0 =C2=A0 =C2=A0 > of the Jailhouse kernel APIs.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Right, the IOCTL API is not documented so far. =
It is
>     currently only used
>      >=C2=A0 =C2=A0 =C2=A0inside the Jailhouse project. This needs to be =
formalized
>     when there
>      >=C2=A0 =C2=A0 =C2=A0shall be external users like a libvirt driver.
>      >
>      >=C2=A0 =C2=A0 =C2=A0That might be a nice small contribution task: C=
reate some
>      >=C2=A0 =C2=A0 =C2=A0Documentation/driver-interfaces.md that describ=
es the IOCTLs
>     along with
>      >=C2=A0 =C2=A0 =C2=A0their parameter structures and that also includ=
es the current
>      >=C2=A0 =C2=A0 =C2=A0sysfs-entries.txt as a section. Then send this =
as patch here.
>     I'll help
>      >=C2=A0 =C2=A0 =C2=A0out when details are not clear from reading the=
 code.
>      >
>      > Sure. I will do that.
>      >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > For the second part as you mentioned that Ja=
ilhouse can
>     only create
>      >=C2=A0 =C2=A0 =C2=A0 > cells with the constraints defined in the ro=
ot cell
>     configuration. I
>      >=C2=A0 =C2=A0 =C2=A0 > have a few questions regarding that.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > 1. Is there a way to know if Jailhouse is en=
abled on the
>     host and get
>      >=C2=A0 =C2=A0 =C2=A0 > the root cell configuration(s) from Jailhous=
e through an API?
>      >=C2=A0 =C2=A0 =C2=A0This can
>      >=C2=A0 =C2=A0 =C2=A0 > be used while binding the libvirt to the Jai=
lhouse hypervisor.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Look at
>      >
>     https://github.com/siemens/jailhouse/blob/master/Documentation/sysfs-=
entries.txt
>      >=C2=A0 =C2=A0 =C2=A0for what is reported as runtime information. Fu=
ll
>     configurations can't
>      >=C2=A0 =C2=A0 =C2=A0be read back at this point. This might be recon=
sidered in the
>     light of
>      >=C2=A0 =C2=A0 =C2=A0[1], but I wouldn't plat for that yet.
>      >
>      >
>      > Ok, sure. I am looking into it.
>      >
>      >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > 2. If Jailhouse is not enabled(again can we =
know this
>     using some API)
>      >=C2=A0 =C2=A0 =C2=A0 > then, can libvirt enable/disable Jailhouse d=
uring the libvirt
>      >=C2=A0 =C2=A0 =C2=A0binding of
>      >=C2=A0 =C2=A0 =C2=A0 > the Jailhouse driver with a given set of Jai=
lhouse cell
>      >=C2=A0 =C2=A0 =C2=A0configurations
>      >=C2=A0 =C2=A0 =C2=A0 > describing a complete partitioned system?
>      >
>      >=C2=A0 =C2=A0 =C2=A0With the API above and a given configuration se=
t, yes. The
>     config set
>      >=C2=A0 =C2=A0 =C2=A0would have to be provided to the libvirt driver=
 in some
>     to-be-defined
>      >=C2=A0 =C2=A0 =C2=A0way (e.g. /etc/libvirt/jailhouse.conf ->
>     /etc/libvirt/jailhouse/*.cell).
>      >
>      > Cool, got it. Thanks!
>      >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > 3. I was wondering, as you mentioned that li=
bvirt driver
>     should check
>      >=C2=A0 =C2=A0 =C2=A0 > for mismatch of the cell configuration with =
the root cell
>      >=C2=A0 =C2=A0 =C2=A0configuration,
>      >=C2=A0 =C2=A0 =C2=A0 > the question is, isn't that done by Jailhous=
e itself? If
>     yes, then
>      >=C2=A0 =C2=A0 =C2=A0 > libvirt can just pass on the cell creation r=
equests to
>     Jailhouse and
>      >=C2=A0 =C2=A0 =C2=A0 > return the response to the user as it is, ra=
ther than driver
>      >=C2=A0 =C2=A0 =C2=A0doing any
>      >=C2=A0 =C2=A0 =C2=A0 > such mismatch check.
>      >
>      >=C2=A0 =C2=A0 =C2=A0With matching I'm referring to a libvirt user r=
equest like
>     "create a
>      >=C2=A0 =C2=A0 =C2=A0domain with 2 CPUs", while there are no cells l=
eft that have
>     more than
>      >=C2=A0 =C2=A0 =C2=A0one CPU. Or "give the domain 1G RAM", and you n=
eed to find an
>     available
>      >=C2=A0 =C2=A0 =C2=A0cell with that much memory. Those are simple ex=
amples. A
>     request that
>      >=C2=A0 =C2=A0 =C2=A0states "connect the domain to the host network =
A" implies
>     that a cell
>      >=C2=A0 =C2=A0 =C2=A0has a shared-memory link to, say, the root cell=
 that can be
>     configured
>      >=C2=A0 =C2=A0 =C2=A0to bridge this. But let's keep that for later a=
nd start as
>     simple as
>      >=C2=A0 =C2=A0 =C2=A0possible.
>      >
>      >
>      > Do I need to match the libvirt user-requested cell config with
>     only root
>      > cells or with all cells present at that time?
>
>     With all non-root cells - the root cell will be occupied already (it
>     runs libvirt e.g.).
>
>      >
>      > I wanted to request you for a favor for the proposal as the
>     deadline is
>      > approaching. Could I prepare a proposal for this project based on =
our
>      > discussion here and improve it later based on feedback comments af=
ter
>      > the deadline? I understand that I got late in starting on the proj=
ect
>      > search and selection.
>
>     Sure, please go ahead.
>
>     Jan
>
>      >
>      > Thanks,
>      > Prakhar
>      >
>      >
>      >=C2=A0 =C2=A0 =C2=A0Jan
>      >
>      >=C2=A0 =C2=A0 =C2=A0[1]
>      >
>     https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2Bk=
HhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com
>      >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > -Prakhar
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 > On Thu, Mar 26, 2020 at 1:49 AM Jan Kiszka
>     <jan.kiszka@web.de <mailto:jan.kiszka@web.de>
>      >=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@web.de <mailto:jan.kiszka@we=
b.de>>
>      >=C2=A0 =C2=A0 =C2=A0 > <mailto:jan.kiszka@web.de <mailto:jan.kiszka=
@web.de>
>     <mailto:jan.kiszka@web.de <mailto:jan.kiszka@web.de>>>> wrote:
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Hi Prakhar,
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0On 25.03.20 05:36, PRAKHA=
R BANSAL wrote:
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > Hi Jan,
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > Thanks for the reply. =
I looked deeper into the
>     libvirt and
>      >=C2=A0 =C2=A0 =C2=A0Jailhouse
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > source code and found =
following two things that seem
>      >=C2=A0 =C2=A0 =C2=A0relevant to the
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > project I am intereste=
d in.
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > - Libvirt driver inter=
face at [libvirt.git]
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>     <https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dtree;hb=3DHEAD>=C2=A0/ =
src
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0<https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dt=
ree;f=3Dsrc;hb=3DHEAD>=C2=A0/
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0driver.h
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >
>      =C2=A0<https://libvirt.org/git/?p=3Dlibvirt.git;a=3Dblob_plain;f=3Ds=
rc/driver.h;hb=3DHEAD>
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > - Jailhouse tool, whic=
h is using the ioctl API of the
>      >=C2=A0 =C2=A0 =C2=A0Jailhouse,
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > available at
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      > https://github.com/siemens/jailhouse/blob/master/tools/jailhouse.c=
.
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > With the help of the a=
bove two, it looks like, a
>     libvirt
>      >=C2=A0 =C2=A0 =C2=A0driver
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0for the
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > Jailhouse can be imple=
mented. Let me know if I am
>     moving
>      >=C2=A0 =C2=A0 =C2=A0in the right
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > direction so far.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0From the Jailhouse=
 perspective, it is important to not
>      >=C2=A0 =C2=A0 =C2=A0consider the
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0command line tool an inte=
rface anymore (like in the first
>      >=C2=A0 =C2=A0 =C2=A0prototype) but
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0build on top of the Linux=
 driver API (ioctls, sysfs).
>     There
>      >=C2=A0 =C2=A0 =C2=A0is already a
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Python library which star=
ted to abstract this
>     interface for
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Jailhouse-internal use ca=
ses. However, I strongly suspect
>      >=C2=A0 =C2=A0 =C2=A0libvirt will
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0rather want a native bind=
ing.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > I have been looking at=
 the other libvirt driver
>      >=C2=A0 =C2=A0 =C2=A0implementations for
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > hypervisors like Hyper=
V and VMware to understand their
>      >=C2=A0 =C2=A0 =C2=A0implementation
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0 > and learn from there.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0As Jailhouse is a static =
partitioning hypervisor without
>      >=C2=A0 =C2=A0 =C2=A0abstraction of
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0the underlying hardware, =
your starting point for the
>     libvirt
>      >=C2=A0 =C2=A0 =C2=A0binding
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0should be a given set of =
Jailhouse cell configurations
>      >=C2=A0 =C2=A0 =C2=A0describing a
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0complete partitioned syst=
em. So rather than
>     instantiating on
>      >=C2=A0 =C2=A0 =C2=A0demand a
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0domain (Jailhouse cell) w=
ith, say, a network adapter, the
>      >=C2=A0 =C2=A0 =C2=A0driver should
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0match a user request for =
a domain against the
>     configuration
>      >=C2=A0 =C2=A0 =C2=A0set and use
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0what is there - or report=
 the mismatch. What it could
>      >=C2=A0 =C2=A0 =C2=A0organize, though,
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0is interconnecting cells =
that have a (preconfigured)
>     virtual
>      >=C2=A0 =C2=A0 =C2=A0network
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0link to the root cell.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Due to this different con=
cept, there will be no 1:1
>     mapping for
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0commodity hypervisor driv=
ers to the Jailhouse scenario.
>      >=C2=A0 =C2=A0 =C2=A0Still, studying
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0what they do is useful an=
d needed in order to
>     understand what
>      >=C2=A0 =C2=A0 =C2=A0"normally"
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0happens and find a reason=
able translation. This is
>     probably
>      >=C2=A0 =C2=A0 =C2=A0the most
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0challenging part of the p=
roject.
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >=C2=A0 =C2=A0 =C2=A0 >=C2=A0 =C2=A0 =C2=A0Jan
>      >=C2=A0 =C2=A0 =C2=A0 >
>      >
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2955ec65-f973-694a-a5fa-5f3a08243e2c%40web.de.
