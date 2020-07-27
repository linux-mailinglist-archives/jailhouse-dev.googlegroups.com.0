Return-Path: <jailhouse-dev+bncBCC7JCUNS4NBBPMR7P4AKGQEGGJ6IWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id A345222EC2A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 14:29:51 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id k186sf12574196pgd.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 05:29:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595852990; cv=pass;
        d=google.com; s=arc-20160816;
        b=MgaARhUk6Ik4QDqjQHplhbnyDMK09vDznC8SaaJsnfukbWyXNNaNQ5iEFuU37XiCDK
         /6yrk7vJxttkZOdK/4ziHOWre4PeUW8FpXjBC0Uz7RfQWmJAlnIpyQTSel7xiyvQByXH
         LNhnrA2s0ttDUfIGmM6/dA6WnXzrAkm8KBRxMdI3cNszLijHXuiukfF4rMRNaSVFfsN4
         iSNp9gjMzAWGwJVWBuH+7KA15RuUBc3JYA8YcFLoFLiHxXMBtDiHzZuN1pFJG972weO2
         g8c/YU7YBZMYyPzsP8gqpbfJb3CfHwiRIevR09SEm+AEt6ZEEQtAJXwgFIyFkbnCSlq8
         1jDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=0vSddvE/UVDAvHPLZ09Y9lRsdXlPC5BB1UK1s/8gW04=;
        b=i+KX752WvPFkq4TguYZiauUpOCu7bUUi4npWzMsSX9QvbOTGY+h4D+uYeqy0Px3k11
         wDRw4ubGcbI0mnQiknbLHtZZkvjSRYN0KPZsPrCL6CCbp53y3rFfhoaftShJ4GWl2iV6
         j5xC/2QvAkG7pHkYZcM0bFlfruI538GskKfTimL92kj+gAUK+kpN5eHNWpgqb5ttKDcO
         gLMSgtLB56JTF2MfLU7aKTh4GUHAd7efPfe2wINYj3R/GAtS1CZP5QiUSuLihwW8u2Ni
         p2kqSMQgLP8BABUxxFc79d/2mGjS7J5PEoznAOwy4gJuabKFwbzMM5Pu+WLaK3pA9p4Q
         Yoqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I5rEUd2I;
       spf=pass (google.com: domain of stefanha@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=0vSddvE/UVDAvHPLZ09Y9lRsdXlPC5BB1UK1s/8gW04=;
        b=ZwwJVgZJWnsZaj7DzuMpv/d118ae4A9TXLtqMI6NfOrsFr2TfXqCdrxTtcEUJ0mNZw
         UfPvP23y8NaccXny48eSlyf3M/nNNo0z1KcE6aMaXuW+ZdjIHIGZZKph124v2y1ORhGK
         IlqymFydd5gXEFAe9IrvU6cz6GmR3Bsum72cFSo/Um9CcbXQ7QG8/uzBNW6ginIlY1xp
         V8vlR3z5RDP/itatXc25IEmq+EoYsRx2XTSZqLaeNdoBrHn4PmgxYhI6n2iqBXOqYWkH
         IkVs71HJtY2D9HhgUuN0AxL4MRTxKDhZUxypVQRkcjy9hpLvOqx9TctxmJhx1hfzz9zh
         HHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=0vSddvE/UVDAvHPLZ09Y9lRsdXlPC5BB1UK1s/8gW04=;
        b=gl1Kg42eOPMM3OuW4A31vC1gVE3Yu4Liv0Jj1PxTJaghNhKnz0Shd3MsCj34ZSLK47
         sQa0VqybAlLXWDl7vBFeIqeXIN+2b6PUTRIPhAVka4CFDoq8y24tHET0MEfgN5TEcmqH
         /HpKjCaVlbfzZWqcELC9yJzHnRsnQMBr58OwOi8VlJ2VfCEB+Ndy50g4chYzSJLdf5G0
         htemJ3gANgSj2bWAL4YvBOEtCjr3+doKvQBigoSO9Ln0Gj9RSmZ4YeO3HIc7RfAtnvjF
         GJQ+3hFMDQeKh2hCnvuwTuioME7WsHj+DB3cstSp/xLi+aTldubV4aFirsqEEkFYjlS9
         GTZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531NGfZyqkjHpoSEUYabWZEYCqTJkrUMWqPUwZFXxosEMU0QlsLf
	H2Y1MXVONucoEUnHygwYzgI=
X-Google-Smtp-Source: ABdhPJyHj98Mqy+teCx+wrxT1EX2WYM/axGlVMgUovBXGNcgNspKKJXqJnMGYe8gwgY2GYqoUvnQWQ==
X-Received: by 2002:a17:90b:1386:: with SMTP id hr6mr18020481pjb.93.1595852989875;
        Mon, 27 Jul 2020 05:29:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:864e:: with SMTP id a14ls5158846pfo.7.gmail; Mon, 27 Jul
 2020 05:29:49 -0700 (PDT)
X-Received: by 2002:a63:e241:: with SMTP id y1mr20210484pgj.410.1595852989298;
        Mon, 27 Jul 2020 05:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595852989; cv=none;
        d=google.com; s=arc-20160816;
        b=ITeiHkGQNN+J9f086S8543Ehycl2kIS3HTeQNTinnABkFpwRMF8b+rt/1xxuYQeA2L
         scjwVH/AODXJuNZwl9D5p6SFiYnLHDyv+Ve7bQmE5JSW+DEDD59otYIcS3gfM5xq/3Hm
         r/0JA6J3kv0AuG9MZVGQMzGYESCDqiyHGP+is0laRKRMurzbcIYRbXDWA6JKCUwtUHIR
         B4dTYeGnWE5qvpLIDUUhtswqDAnTYbXYCqb4NSKMhdzWQqP5c3v2vXW9mDlJAP5q3daY
         ALEYbNd2oMCACuayvRi4hW3uyIXVwFntBaqikOgrpeOrXdg5UCjH8v2+9V2gxIEwE2w5
         18RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=F4uavNF+nYeIfbchy/Gnexd3ES9/AHoWblRFnJoTCPA=;
        b=sxeO6bbIF8l/qY5KFTtkEX1G/MzmmnquouYj9c/KIFuYFpSKWDOblGqpY8U50ZPNVC
         I+9ruHsLP1qL5wIV3kH5VZl/5Ad1YNMiQRTeBdWA/YQ6Z2eTR4CGIf1AeCtZ8CWDgedC
         8HHyEBnsF3hXHCEkqqtKQkd7OFx3F8B/hteEz2hkJ7RHxdtYLYfJNVKxyRxPDaasqXyh
         GwuG4RlAyyyfDxEVU2pusWAWB7yrLus5EjNT7Fpo+Aw64mj+md09Qkys/+iPk+fCCU2S
         uDJ237VE95CYciMNdAiT5UttMuyfad42RI9qgekp9loP2L5CBedsZFhnSB8prI8Pk31Z
         ttdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I5rEUd2I;
       spf=pass (google.com: domain of stefanha@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by gmr-mx.google.com with ESMTPS id f11si165596pfj.5.2020.07.27.05.29.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 05:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-aOR3GZT8Mj2cGLnXAL6lWw-1; Mon, 27 Jul 2020 08:29:46 -0400
X-MC-Unique: aOR3GZT8Mj2cGLnXAL6lWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2F080BCAD;
	Mon, 27 Jul 2020 12:29:44 +0000 (UTC)
Received: from localhost (ovpn-114-74.ams2.redhat.com [10.36.114.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24E215DA6A;
	Mon, 27 Jul 2020 12:29:40 +0000 (UTC)
Date: Mon, 27 Jul 2020 13:29:39 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	liang yan <lyan@suse.com>
Subject: Re: [virtio-comment] [RFC] ivshmem v2: Shared memory device
 specification
Message-ID: <20200727122939.GB386429@stefanha-x1.localdomain>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
 <20200723065423.GE268427@stefanha-x1.localdomain>
 <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
MIME-Version: 1.0
In-Reply-To: <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
X-Original-Sender: stefanha@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=I5rEUd2I;
       spf=pass (google.com: domain of stefanha@redhat.com designates
 207.211.31.81 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
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

--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Jul 23, 2020 at 09:02:09AM +0200, Jan Kiszka wrote:
> On 23.07.20 08:54, Stefan Hajnoczi wrote:
> > On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
> > > On 15.07.20 15:27, Stefan Hajnoczi wrote:
> > > > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> > 
> > Thanks for the responses. It would be great to update the spec with
> > these clarifications.
> > 
> > > > > If BAR 2 is not present, the shared memory region is not relocatable
> > > > > by the user. In that case, the hypervisor has to implement the Base
> > > > > Address register in the vendor-specific capability.
> > > > 
> > > > What does relocatable mean in this context?
> > > 
> > > That the guest can decide (via BAR) where the resource should show up in the
> > > physical guest address space. We do not want to support this in setups like
> > > for static partitioning hypervisors, and then we use that side-channel
> > > read-only configuration.
> > 
> > I see. I'm not sure what is vendor-specific about non-relocatable shared
> > memory. I guess it could be added to the spec too?
> 
> That "vendor-specific" comes from the PCI spec which - to my understanding -
> provides us no other means to introduce registers to the config space that
> are outside of the PCI spec. I could introduce a name for the ivshmem vendor
> cap and use that name here - would that be better?

Sounds good.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200727122939.GB386429%40stefanha-x1.localdomain.

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8eyLMACgkQnKSrs4Gr
c8iz3gf+PR7V8VCympAWs+Z7xHZgGlFUy375IgC6F5z+6fundn/iK0s7G4F+x5yO
H3NmnoiUpdobJ52yzuTaft5DEsdL8GZ3AoDeCNp0TzU+89PFsXzDeozT9v3FGagz
GLnwzyCpWZ8qfbEJSUeKk549gfdqunLm6liqo3h6yiBlAs6dYAnh9RppXFxVdmLw
ydiDM+1kLBmsU5SCM8x1Uq2DNyPPySQukuCqUMQe8ssbI3L52y5+k/xverd44fUR
rGYc2n3Z6pZ+prPkRRkUKycP0H9csQyTIcIs7PKGMhPKOMqoXCe174y4dro4GrAb
+HGBBvp2fW5ztZHRP20XjqrWhotyow==
=AR2l
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--

