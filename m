Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBW6BZGAAMGQELXRKS4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D10D306DF8
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 07:59:40 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id b26sf2567208lje.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 22:59:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611817179; cv=pass;
        d=google.com; s=arc-20160816;
        b=bsPaojIdk+fmVUpIkSuLB9JRSUIQKEeWSpKXv/MM3TbpRAjtbANcwv6Sg21AgQkZyp
         ShqBAEteeMgP8MO8jv+D5ql2OrOYTA0u/3Kr5drWGrG5rsVjk+1LbrHyDPlg21gnEHBJ
         N4bCKmIuva+xxHSlHTACJ4tR34nAejuI+AogkzAHGpPX08mfAVjNnDwpl2Rl2d+cl0Ew
         K1cQc12onq/P6pzBug9Ai+ij+/zr22Df7tyrUcrphdoLyBSL5gwweq7rEj68wpZjABwt
         Pd46xJTSpvPwCwWXqFjna0HBGRSZf7bRwmmcXjHx2IpazKHEEHsVvqIMzOK/ffnQ8ZuA
         /HNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=Y86hIZpqJZ7q0hAEkPuCX3FlsASWYKlGjSpw8ScHrI0=;
        b=LH+9VOoEObAbxaeHmMagU/IngauLS5ofhTFWESCpywRtnO83avNt7IzwjfU0wqjcf+
         2ZnUE2RVJ7d0AdidVpyD4DY440YHU7My6tt5uqWF+6NJ6u29w0pyy4H/6WVwdHltPK6f
         L/ypM79MAEZpUe+GkSG24CIOjk4Ae+ad1ut0YLyiMyqrwHenoZtdjEFbKL6OW9l/szYe
         d2u3Mz4FTiJbkl/c3lUhfMVsUgN39zJi7fThRFupOcIH4l9L2/loKli9tBkShara4RPY
         a0slKyAwRcFjK8d5e1bzS/9aD1HqFWPbPkSgLw9U4xouhh7CA49DC2PG5EtdBWiNqJxy
         hOWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y86hIZpqJZ7q0hAEkPuCX3FlsASWYKlGjSpw8ScHrI0=;
        b=JW+5BadrUJlWxZFlBcOVetwzOOiRIxeAUgFplK1ypbfdjBw350dmuIpSVvqac7iHLf
         tNXNcy4EfdiZCkWt29ZhDHev6IEEmoclN9N4zZ9E0gF4xqwjHFKOhQooI3hKvSkAOsTz
         F5hKtdHe5csut9/u5j1BxY9P1VyYIvB/WgmCAdET4UJ7oTLu4MM5eYKmxTnHXm3EfEnI
         xAnWbCrwY8jfQHa4vPuSKxVJ2kzE6cRbp7hDMKXJuf/xfWBjSGRsVpklrxmRRKqiBaLC
         zIQbYp6c6gOb7mxd07Jt2gnDdr82ip2qbCvHtwiZr+r8Donb1u6CwwQF8s/ZCxXhhr7u
         akbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y86hIZpqJZ7q0hAEkPuCX3FlsASWYKlGjSpw8ScHrI0=;
        b=MpKUAFQLsSyuOIDzdInHZxswmsZ2dpTH3sUOtfKewly021HTavdzaKTt2El/nKSbyK
         hmaDdatYEXNja3Evqogxk8yhqHHEQbTOqgGTGjMJ2za86aNcTGGUBV3LzTK3g0FUMIvB
         y39lunv3yKiUt9lxtJGqoVZxivbqaleeT9JyJnoLdXifQIsVvBSLGCgpsSl/aDatVhsI
         aRV9eQtk2ql3LdcRnXsenOMTJCEm/TFE2UZsGdJp7tH2uMzUVf1ryXx0yWOupwQ37zd+
         WsW2HbsSqHDSBkdMAg1YT62foLJGeLyyKXD7HzZGVGfjb/ygE/wWAiKzon7DPKcaJdhT
         RCNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Ggaevzfs52EXx9DHnXLhvznSYuw66kYWNWwlAklNV/P1Hg7Jp
	HzifvjEYbkUoGn3UoB9byFY=
X-Google-Smtp-Source: ABdhPJyEYZo67FuVxy1VkzgVL/CwvYly3WNQrgijGGFQWyMqi2SGzerMo8mBr3E7U4wiWCFLhVsr7w==
X-Received: by 2002:a2e:760a:: with SMTP id r10mr7661458ljc.11.1611817179573;
        Wed, 27 Jan 2021 22:59:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8745:: with SMTP id q5ls830879ljj.6.gmail; Wed, 27 Jan
 2021 22:59:38 -0800 (PST)
X-Received: by 2002:a2e:8116:: with SMTP id d22mr1661600ljg.48.1611817178553;
        Wed, 27 Jan 2021 22:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611817178; cv=none;
        d=google.com; s=arc-20160816;
        b=PLP25/OwHRiLCZJGwjBj//jKjVdJGYW/rdXGP1v1T3+kn5oPFwKfxnqMLj4tqK7pFK
         qbxirIR0qPV4rBeWWYtTyop+UIS6zOoyFQBECauHzA07/o+vOZsvlY/MU+KKmGc9nV5c
         M0OK4vdu2HDJ8zttOc3P4+F+FodZemdNow/BBg8Kld1AePkMf3ee7ctySKxJ5gineVgO
         Ih+dvAUWusHlX7w+YxN8EWLqE8o0crG7/MawA5vGWgiD86Zw6CQHOY8UWhoGAa5cOKE3
         pjz/GZehp8Kj/I9S4v2nCfdz9Ss5UUpCpIroZZ8JPNs4PB4yLOVqx+NOGDfVrHQbDojU
         F7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=YytZLfUOwGv0n4m+FSHpDoB4KYRh7P5MB+1BnnDwCHQ=;
        b=p14MQlp5H5evYkyQjiY5ha2QgroxV1g8WanixYyPbH3ILrFWYYW+/dk9MUMdEV4EWT
         zAC8udEIweeiAHRUJlv9jnwyJUcUY77zCS1ZkrbChNEpcMWNNXMRBS7kWIwIDoXL1b0J
         W3Vt+85lukRpPPioG9iuxCR7NE7k76K+e7JAjdnM3QDEG5MzPYI/WrA9ohiC2b9uQF72
         P1f5lZDPcoEyx6CPBvTxQpl32vceT4FQakNkN2kJdDndfY61jIAypFKU9G4/EHvvNUFj
         Ts/n79k8Dy3p6gFmka8OWCeV8Oo4GQ9Xx82vjknMGH/crCR6cdkdpen6MrYyFfWkk/dy
         FOMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f18si241056ljj.1.2021.01.27.22.59.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 22:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 10S6xbYA008178
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Jan 2021 07:59:37 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.63.187])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 10S6xb7X017962;
	Thu, 28 Jan 2021 07:59:37 +0100
Date: Thu, 28 Jan 2021 07:59:35 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Jan
 Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>
Subject: Re: ivshmem-net issue
Message-ID: <20210128075935.648f6522@md1za8fc.ad001.siemens.net>
In-Reply-To: <DB6PR0402MB2760E2A8D41ACC217410A85388BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
	<20210127195845.348673a3@md1za8fc.ad001.siemens.net>
	<DB6PR0402MB2760E2A8D41ACC217410A85388BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 192.35.17.28 as
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

On Thu, 28 Jan 2021 01:28:32 +0000
Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: Re: ivshmem-net issue
> > 
> > On Wed, 27 Jan 2021 09:08:28 +0000
> > Peng Fan <peng.fan@nxp.com> wrote:
> >   
> > > Hi Jan,
> > >
> > > When booting inmate Linux, I have ivshmem-net configured. In root
> > > cell it shows as eth2.
> > >
> > > I monitor system network, and see eth2 is assigned a random
> > > address.  
> > 
> > This is not "random", this is where some dhcp-clients end up when
> > they do not receive an answer to their requests. It is a fallback
> > when there is no proper DHCP server and machines still want to gain
> > an address to potentially communicate. (zeroconf APIPA)
> > 
> > So it is worth checking the DHCP server to see why it did not hand
> > out an IP. Maybe because of the random MAC that Jan talked about.   
> 
> What do you mean DHCP server here? The eth2 is created by ivshmem-net,
> it has no physical connection.

Well if you do not have a DHCP server in the other cell, you probably
should not be running a DHCP client. And looking at the address you are
running one. You probably do the whole setup on the kernel cmdline and
that works until userspace goes and configures that interface as well
... again. You have to tell userspace that this one interface is off
limits and already configured.
How to do that depends an what is doing that, probably nm or systemd.

Henning

> Thanks,
> Peng.
> 
> Or maybe that
> > MAC was taken and the client did not have a valid lease for it.
> > 
> > Henning
> >   
> > > [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope
> > > global eth2 valid_lft forever preferred_lft forever [ROUTE]local
> > > 169.254.232.89 dev eth2 table local proto kernel scope host src
> > > 169.254.232.89 [ROUTE]broadcast 169.254.255.255 dev eth2 table
> > > local proto kernel scope link src 169.254.232.89
> > > [ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src
> > > 169.254.232.89 [ROUTE]broadcast 169.254.0.0 dev eth2 table local
> > > proto kernel scope link src 169.254.232.89 [ROUTE]default dev
> > > eth2 scope link
> > >
> > >
> > > And also in route table, it added two entries going through eth2,
> > > I not understand why it will add one entry that default use eth2
> > > with gateway 0.0.0.0 #route Kernel IP routing table
> > > Destination     Gateway         Genmask         Flags Metric Ref
> > > Use Iface default         0.0.0.0         0.0.0.0         U     0
> > >  0        0 eth2 default         _gateway        0.0.0.0  
> > UG  
> > >  0      0        0 eth1 10.193.102.0    0.0.0.0  
> > 255.255.255.0  
> > >   U     0      0        0 eth1 169.254.0.0     0.0.0.0
> > > 255.255.0.0     U     0      0        0 eth2
> > >
> > > It added the eth2 route table and will break nfsroot if we using
> > > 10.193.108.x for nfsroot server, because it will match the 1st
> > > entry.
> > >
> > > This is not jailhouse hypervisor issue, I just not sure the eth2
> > > behavior, it is systemd does that route change or we need look
> > > into ivshmem-net to avoid update route table when creating eth2?
> > >
> > > Thanks,
> > > Peng.
> > >
> > >  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210128075935.648f6522%40md1za8fc.ad001.siemens.net.
