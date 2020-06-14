Return-Path: <jailhouse-dev+bncBCE6JKFIVQARBL5JTH3QKGQENWZCBBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2A1F89AC
	for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jun 2020 18:47:44 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id r9sf7644744oia.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 14 Jun 2020 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5wiLrVEugaxJgK5e0ow4ui9/5VrZqPDwpvHN4wtfU7s=;
        b=Cfn9latwU6gi3CdpK8HTRXWuq2T7v33ZjL3desRDFC+y7TkLPTv9J8S9G+21T/GV3f
         5tg+O5oJ77rXXfnCb+BhfQpeD5uk0i0fSr7aI5nn2dQxpivgQl1eqnbnZwwAKF0hZMvF
         6bO7eBP8B62HDGg6E2ID49KG4Il/+0SDvN1M1yI9Jb8XI0eAJH5QnIVVEsndnNEiVIRi
         L03xQsuRsnHK1VBocBud9cQNs1WKKo/cbnd9N0dHLcMRtxB7PICiZaop9IPuvreSDO8X
         RuzwLd3qVJI0VscXW8za7A7yu08rfYEe1W4iaJYr7/spiYl+e3+AzN0H2ofbFkTDkotw
         gkFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5wiLrVEugaxJgK5e0ow4ui9/5VrZqPDwpvHN4wtfU7s=;
        b=LE+T5f1gDuYGQ/VHWHpZgyQHBIH1aY53RCDrae1k0p5TC0IdIJwGgl4jwINz8iX/iN
         sTOLRdolw/OwCKbKdVKY+WC42Lc8uV0IVVNvRiBsXVYcUsGDBYO+XRcCCzPW66h7dexX
         sCem9C6R61QjAcR+LxqCmhnICW6QpkI0+N6hWoeirpMIempzysiqJH3ZCA+dj6a0VUyW
         m9OWZau1qghvB2S8orWPnyzit/sCH4Nk3OzX65ArGE4XW/2XCC01Ip6GLf0xCCnkEtwq
         VXYZ9s+B9FGXTMeqBRW5WDhc5Ef1joTHon6fbKSnxY0j3UcF1Z8VLJtGQqcHZgzof0yT
         Q7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5wiLrVEugaxJgK5e0ow4ui9/5VrZqPDwpvHN4wtfU7s=;
        b=Y4xSQzbZs7LFDrbvm1SJxYLPCYaT8a8mIO/Cf4v8JgKTRZGGXaUOHuYGe6/YgVYSHf
         hWUgbzGw4bqmPPzYcs1XArzRV5HpcVzMSHkaxs/ewEimxzPFn1KnvqrMjlGeBKE7ZTeY
         XCOG4PaqXncPn5PIb69ZpjhWBUNIasTe6ROJ/qX6vuwm79vL9BSZb2pVnTz3rMDXujjZ
         3X8kMd1HyR3FFF+y8aBmOrz5RMB8WB6VuUmfvWH57VH87m9JDuJyipzmVDjJw2rcsLJS
         QFz7K6ULkB/JdH4x1W9aXF/lt57a1Sw+gUP4qJB6htYE3L1Piovi25vUUsjNmtIQOZpm
         ABag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318V1RL+fPt4cHDsGImOOjNnmCDat49oPpQB3mppz5CocI3wSy2
	F+5flfDUffau0D0pOssv1ec=
X-Google-Smtp-Source: ABdhPJybm1bZZgPD3qPCnBjG4igqoKninuws/N54o8BundFAsPr6AXzxJ/ok/Dbm/2dKAfktS1AQ4g==
X-Received: by 2002:a4a:9c44:: with SMTP id c4mr1084744ook.46.1592153263336;
        Sun, 14 Jun 2020 09:47:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:dbd7:: with SMTP id s206ls1095066oig.6.gmail; Sun, 14
 Jun 2020 09:47:42 -0700 (PDT)
X-Received: by 2002:aca:5a05:: with SMTP id o5mr5916837oib.138.1592153262830;
        Sun, 14 Jun 2020 09:47:42 -0700 (PDT)
Date: Sun, 14 Jun 2020 09:47:42 -0700 (PDT)
From: Pratik Patil <prtptl.smilingcorpse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <48d5b02d-0670-422d-9374-b69161ba1607o@googlegroups.com>
In-Reply-To: <CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk+byEtk61ghXmA@mail.gmail.com>
References: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com> <e4a04bc1-1254-5d12-05b7-cbd717815078@siemens.com>
 <CAJxPjDwf667o3SHfPLmq8e9z72nMSLsZV6SWk+byEtk61ghXmA@mail.gmail.com>
Subject: Re: Reboot root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1041_1369729843.1592153262365"
X-Original-Sender: prtptl.smilingcorpse@gmail.com
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

------=_Part_1041_1369729843.1592153262365
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, June 12, 2020 at 6:36:13 PM UTC+9, Thorsten Schulz wrote:
> I found this an interesting question, thanks Jan for the concise (yet pos=
sibly obvious) reply. Pratik probably has a different usecase, however, a l=
ittle side-note here.
>=20
>=20
>=20
> To comment in general for others reading this:
> This is quite important for the system architecture considerations. So ev=
erything that could foreseeably require a reboot during run-time (e.g. ever=
ything that could require a security patch/update due to a CVE) must reside=
 in a non-root cell for this basic reason.
>=20
> Example: In my setups in the past weeks and months I have considered the =
root-cell only for setup and "health-monitoring" - esp. not connected to th=
e outer world. (* in theory ;) ) All functions and interactions and ETH-car=
ds are actually in Non-Root cells.
>=20
>=20
> just my 50ct,
>=20
> Thorsten


I am assessing production readiness of Jailhouse in terms of updating the h=
ypervisor or the root cell without stopping VMs(non-root cells). Periodic b=
ug fixes or security patches can require rebooting the root cell OS. This i=
s generally done through live migration of guests and cluster-aware updatin=
g in hypervisors like hyper-v, ESXi etc. I am curious how updates and reboo=
ts can be done in Jailhouse without stopping operation in non-root cells.

Pratik Patil

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/48d5b02d-0670-422d-9374-b69161ba1607o%40googlegroups.com.

------=_Part_1041_1369729843.1592153262365--
