Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBQNPQ2BQMGQE3GX36NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id C701934CBEC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Mar 2021 11:02:57 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id q25sf8254520eds.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Mar 2021 02:02:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1617008577; cv=pass;
        d=google.com; s=arc-20160816;
        b=O2W4mqqmSu/7THqREnAI/TXdIETcjJVjoaIp3H/bDOCg/0zzPPu6jPjAtCgJVDTYiy
         9TKeVK7OpxwtrdoE12nsUKP7SeVpSA9QiU4GeZHCic6n/oAzUYtLB3/91YN37yPnsE84
         4Vp/Et3wnsps6wlZqtnTXQt4vHAyrGbJheiyivXdMlfh0hOekl+WqE92WOeh9vHertpO
         9vg/EjxURuzFx9zms+GEr9vcZjO3RlL+iEEW0EIJlmos8I/dXKCMSGrGdIB+On36vhim
         DJTpS0IKYS+HuSjP1sofo2r+eW4MBBbvdCCrfCo1o/SGwmAseVDSmBAoVuSpyLWSVSza
         O/8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:sender:dkim-signature;
        bh=1rZoeo+aCiuj3lACeTmM8481l0qmSFXHxEVwEBwSRuQ=;
        b=u/jHO6rSBlJ3ccRjz76UXDE1MrVi5T7fHTftUQ/hGsvHkdhlQXWzA4l1kHDTAVf9FX
         mdss/RJhzEkss4k0wedcJarkPFxrPZb62BGTmYsNtM2f1GmHTNezTVwdd+CfMuvbRAnG
         zfHwUCCYRokihzoPHfJvfEh+WpDuG8W4eIin8H5HwC0r/shW427bzTgmincgJ6GQZd0U
         MmXceUtRVdQkPNntcaHVQeyv2EKwe62ioJTPXu/zE8T7okBVSeJSdC1hfKd6cE1Hsknm
         ijlKL3Xq/+VqlQw/K3XwMAT4fFIWvYcR6gx1PXEHWqwlK1SsaN5Pb4y22D8Q+pnQLkNm
         yc3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1rZoeo+aCiuj3lACeTmM8481l0qmSFXHxEVwEBwSRuQ=;
        b=rx3sJSKgxgZGdUYkSEYR9LukvORJTnvBnpIup7aSGpu+NWZNru8+ks3AzrRDjBi3iC
         N7aEmKJay4u3T2icOQKYFCmClQ0uEuy+z5UEoIwRnt1/rCKRTwHdAoLY2CQFz3LvMOLJ
         yskRH/vRZwKkCU8xwRD8lVXDe0cqPKAW+U+hm//kSONbLHGNXW51juqvBaWN5m9AobLc
         CWtpVDQTrwTnsv3ClIdvcAEhbReurqo3377OAOmps9VbmoG87OV/l2H/53WAPn684uKN
         00fwoXepVi+LIn2TTuncJ4ttvL9P13rMlACX5iwJypOiqe0v2nirJUAton914VfVuftD
         /boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=1rZoeo+aCiuj3lACeTmM8481l0qmSFXHxEVwEBwSRuQ=;
        b=FtDmh1Do5at90Azt4s9ArCJR86qUFFSsQ3uIGZiP1BAws7wfnw0OJiaroDEgN7YjjM
         BloqVBJjz3ipmZ2SChsZrxPErh1pDp9Re6/wJtqP9XEu92juBy01b8NoUM2fWAGP0Si4
         Mxqc0JH6zGNy/yCfPtzsAbsku4KEjC0eNvsjYIg6UesspNoufXrxmGrDSb1JWO48tVLJ
         eIDlc41E85sqOqGt9hdk5I+FmTy9rvABr58euKdY4K9yFPpNGeia8Key7jcWGhoEWftU
         hommt16BHE4e4TkDxVJZk6w/nopTrCv4OfoU43Y+uQOW+vMCUuxmF2dTeLErLbxJfvbH
         vw6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530rJccxfVC7sGl0SZGOiDw1u1FrSQRRUbJ0u62BXOU8nEPio0Vr
	1JLEINoRkK/PwGj+JmzescY=
X-Google-Smtp-Source: ABdhPJwv6RxZkcQ34yJuCZoO/Ow4yp0IIvB+BDN6vUTtY2lB8wzi2ddHDE9QPUxIBk4B6rRstSuTcQ==
X-Received: by 2002:a17:906:5248:: with SMTP id y8mr27029633ejm.150.1617008577452;
        Mon, 29 Mar 2021 02:02:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1901:: with SMTP id a1ls4696376eje.0.gmail; Mon, 29
 Mar 2021 02:02:56 -0700 (PDT)
X-Received: by 2002:a17:906:9714:: with SMTP id k20mr27237974ejx.519.1617008576564;
        Mon, 29 Mar 2021 02:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617008576; cv=none;
        d=google.com; s=arc-20160816;
        b=Ku9dOGoNjSq7YyQs2dwwqrbhDXigg/Bhawaful3JPAJDPSxjkZ7yClSLGABnHQJnzs
         hPQzXXcP53iO/Ng0S1+0wk9WxZmfi2cxMg/xjH/n2nlmhyudlL9TYcAjmF14jjInkEtI
         gslPPM6H+4+jSk57RJfA3/xsZKpHVUIbKvjcToEqzTBD/dzkukKaIHI7cAxUs2d/8LSa
         SwGEfolpdIBdmaF0QSPQqfXrprsaX8OOus2iPuAp5tayruLSS41Nio/Xv8siM4AcgRYM
         k9ogIM8f0Io86sopDA5hzrAifEAFKoGB6o7ZymzlpOm6Voyrp7UprsFIQleM0EZ/Muxm
         51cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Y8onBZT/k9QU5HVyqEVet7D4Ib1lcKsa17yYTaQx0Us=;
        b=hOQDuZDkZm6MWicyOZuMDVpFDa9idkH0+SykYt37nauVQIbWflpa3YvT1hLpfuNqEZ
         g/9m1CmxcKXMNFKBzvW1RBzTHKT8TP8YCpItMXVCiyx8GqAhcetAzrSir0iZuVIIW02u
         XTvkz7zwXRlCinkCD7nMfPDwJy3WWL4qvawPNkh0FEgPmAWI2r8W2gmBT+0eZ5h1K+bG
         JdUIvXI20HniO+ipn+jl9jBrkU5tqK8oW5yU4vcbBjKSsrQdM6rNUiCdeclksAeUXEqv
         Q91KvgzoLdza8WWzUZmcVphNy9hf44HiZ1tKwaX5V2TeacFk9R4lEFxL9mvI61FzlRKy
         rUOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id ck26si292642edb.1.2021.03.29.02.02.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Mar 2021 02:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12T92tDH005575
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Mar 2021 11:02:55 +0200
Received: from md1za8fc.ad001.siemens.net ([167.87.41.127])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12T8lpUB011384;
	Mon, 29 Mar 2021 10:47:55 +0200
Date: Mon, 29 Mar 2021 10:47:47 +0200
From: Henning Schild <henning.schild@siemens.com>
To: =?UTF-8?B?5pu55a6P6bmP?= <caohp19@lzu.edu.cn>
Cc: jailhouse-dev@googlegroups.com
Subject: Re: HELP
Message-ID: <20210329104747.2f396831@md1za8fc.ad001.siemens.net>
In-Reply-To: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
References: <53464ac4.9478.17879314390.Coremail.caohp19@lzu.edu.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
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

Am Sun, 28 Mar 2021 22:16:14 +0800 (GMT+08:00)
schrieb =E6=9B=B9=E5=AE=8F=E9=B9=8F <caohp19@lzu.edu.cn>:

> Dear sir:
>=20
> As we all know, the cell could communicate with root cell by ivshmem
> in Jailhouse. And there is a virtual Network Interface Card(NIC) on
> non-root cell. When I run Jailhouse on my raspberry Pi 4 model b, I
> was successful to create a cell and assigned a address to it. The
> root cell can communicate with non-root cell , I know this is based
> on ivshmem. But I want to know=20
>=20
> 1. Whether the virtual NIC support other protocols.

It is a virtual ethernet connection, on top you can use anything that
can be done on top of "network". It is probably best to build whatever
you need on top of Ethernet, maybe nfs, remote desktop ... but if you
really need a custom protocol at the base you can write your own driver
and choose another ".shmem_protocol"
There is ivshmem-demo giving a simple raw usage example of
JAILHOUSE_SHMEM_PROTO_UNDEFINED.

> 2. What is difference between virtual NIC in non-root cell and NIC in
> root cell.

There is none. Once running under jailhouse a cell might see the PCI
device for shared memory communication on the bus (depending on the
cell config). If that PCI device is of type JAILHOUSE_SHMEM_PROTO_VETH
and the cell has a driver ... you will see a new ethernet interface
becoming available.

> 3. Why the virtual NIC cannot ping baidu.com(in China ) or
> google.com.

You essentially have an isolated network between the two cells. To
connect the inmate to the internet, the root cell will have to become a
network router. So you would set up i.e. NAT to connect on layer3

The most simple solution could be to create a network bridge where you
attach the real physical network interface and later the virtual one.
(in the root cell)
After doing that the non-root should be in the same Layer2 network and
can use DHCP to get a network configuration that will allow internet
access just like the root-cell has.

All that is basic networking and has nothing to do with jailhouse.

regards,
Henning

> If I get your help, I will appreciate =EF=BC=81
>=20
>=20
> Yours sincerely,
> HOngpeng Cao.
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210329104747.2f396831%40md1za8fc.ad001.siemens.net.
