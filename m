Return-Path: <jailhouse-dev+bncBCC7JCUNS4NBBK7I4T4AKGQEXJSRZVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 489F722A924
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 08:54:36 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 7sf3213023ybl.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595487275; cv=pass;
        d=google.com; s=arc-20160816;
        b=yJ+e0R2DWD4e/V/dROgZwR2hsRAFJug0RVUD6C7TwLYUPN6FhCmxldtr2CwZ9fIvbZ
         l7BfoBN/akX3FGR8F409kYxlGGl/U2SuOLpqHFjD6VOe7wpAsF5Y9XArIPwIApelfU/n
         6XFdhqDoWvHa6uMLxWyqlET6hyLdQMLBuxNPD4UF4tiErvrNgPY0O/sGPKNXbzpy6cWI
         67UmM7dgXr76Q1BmgzA0TpID2zq8YiJTqNweuhC9zcuzUw7EsSBtut4woeZcQXHaQ2oH
         OfPxsr/E3VTBrN/hVB+lh1abYO72aHa07NeCxKxeFKgXBA1Y9/uPDxrfkIO2SuprV1AO
         HFig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=Y43KFf9ydYqfiAo3ujCa0+LOAWEtEPmrZhX+CpZmoUo=;
        b=sF8LmAnOwAcfcB+TYkNR5SS4aTm/qjN/KzP/+EsAVDgRdUGaYUTCCgf6DaB1EnqRE7
         g5QU4UdXZSbCVxILKT5/1nysT9QdT60cpokwHt1wZqDxfRLEvmIpkGC8UXDg81lfOdfL
         MIvtvtHKb93M1jX/+IFLOnCaIMLLO5NXjqOyMOnPfWbhWVUyT0eX3ERKYbh3OIS3x3ry
         lCAW2ftsRzaxD+QmiwDjhvZWM2BH8y7lMzB2hWxc1L7S90UuY3tlwjGm9z3w258S+1NO
         nt/srGMtpbhXl6w4FC9padBay+Kx5nu9KoBN04fsCSDi0RAIuFyIeV4wUGxRkotI+PZa
         KOTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c9YDhwS/";
       spf=pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y43KFf9ydYqfiAo3ujCa0+LOAWEtEPmrZhX+CpZmoUo=;
        b=hiTii23p5se2qWcKxPhMptP8A9YWRNZhAVB7G7PD7uwWdFxoVoKLbIW3+tEQ/80CwH
         Hy2fYuVdaxsToowh97PpjgEQoR9adn6syHH+yuH043xyC+bOVBpCdLXPAp+8wYsOiUE2
         Niw0p1K5+/on0CU+QFx8V9JsQ8UDC/dlyLJt8pf3n/92JwzwfY9RlygUCzKCJZdfbXYO
         GuEQoFnqi+yC55QoDJEpQs57cd3lnuq1TUl3TydQOJWYXohU+4pU41/fvl+OwKnjruOp
         YLHzieb/gafV0CH3/JgVOPvZsLJdQYYBKO1kkdd3JP8LMRKDvjIYoaP4zwTtmsJVePSc
         kJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Y43KFf9ydYqfiAo3ujCa0+LOAWEtEPmrZhX+CpZmoUo=;
        b=omERNPokPc2u2dU+mIQOvL/XouBh2oMleT9iEh1zVFWcSOWT4pbXuPl/EvPuT4wQAd
         ODoT648M3IiBK3BYrVryGx7yMyQ6+aapnRGkNiFn3ZsVqZmvM/HAaMJDOdasVt1VTHwm
         6io3Iol/3585XmGNxS1WmMm6cWL7s87lKZQqxCOTKJ0ouYUGq/kFevmhTE8I6GoDmXUD
         EDS0DQKLAADUAAV+okt9MwqC+W8vIITNBeF8MBk9lQSpdt8MYVeO0AFCgIX1OEgiXATO
         y7DFXEj0QMK1xhnPF5BdV4OsCXtMgAfQlm/BorhBGJmOKiM27ZPgCwYBgS+re1nixR28
         hgbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hsVgnLDg9mPdAuSPsX93qqVyTSCHN5iQRK3dsc7xeHE+jBeI8
	eGVJ+DrFB0SECeIuvggf9xo=
X-Google-Smtp-Source: ABdhPJxa+jU3yWAgu1kVE8qtgQWJ8syYBJ/g0Wy48oKtfNjjLOe6wkxzXu1TtuhfxJlgYvoCjzPtsA==
X-Received: by 2002:a5b:4c5:: with SMTP id u5mr4597360ybp.500.1595487275352;
        Wed, 22 Jul 2020 23:54:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2597:: with SMTP id l145ls1789265ybl.0.gmail; Wed, 22
 Jul 2020 23:54:34 -0700 (PDT)
X-Received: by 2002:a25:d843:: with SMTP id p64mr5190541ybg.68.1595487274846;
        Wed, 22 Jul 2020 23:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595487274; cv=none;
        d=google.com; s=arc-20160816;
        b=pSSXbS/5I5OIPI4qiY6wMJZdbCK2XrnE8Jp6FXQg5q64mJNtVsq4O/N74c3/l9IG48
         o7zoWqbTrfo06pTVCxEV6OcMqENiHAPLEh32AC8vqwgY8YvLIqSn2OI9y9kuncynWwIx
         JiI8HlwWOLrWyR15aWwUTQhXeyLkn5F/tgeuOFz9GimGmo4rM8raGrrADtVkbS5WRN24
         WNCscoXCujpfchO8K/vLB7qf4LUsmuaenEs7KyhxG00bEKKmsjlPiOzrRZn+93eF3QzT
         xn2uVXANbj3EAfz8C5cjHbpAkPbHZM9H1a+P+3qoRQkqvroevQT0IdhO3aug08rRnLsb
         QtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=E0jBLOg3PXf+PwoMlF70oXxdvZJUwqGx3A88F2ekrnU=;
        b=pHcfVG+hqvsqAcMmFT/GfCEnKEZeW/r7URSGfLoTCQpr42uGA3QGqZ1ZkDuJgvPVlV
         s9VEKYmE04ms2i61FO0pK+eRd1NnJV6R2Wxat4Ya6TUSS0L3x+AbJG78rXj4UbSS7G1T
         Y/xz9dnEY4hPqGHW9VwVacdkYkdI3FwEWVc1c3TwGcmAO24nxUFdG4VUXn9XRXRsa4gZ
         sVBQRJZeQMaQWSR2HpAOEIk+MrTBOnJx3aVez3z96KHnFJcfSjrTfyFI5w5zaFDIAXJn
         B3gLpEN563SwbgViQ7jgvcniAo7Of65qJANftyv/TgAv2918G5J8DoQgwz/XmL2+WdvG
         uDFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="c9YDhwS/";
       spf=pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by gmr-mx.google.com with ESMTPS id l126si173227ybf.4.2020.07.22.23.54.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 23:54:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-8PSZ-f0CP2WLVsQwmpLXXg-1; Thu, 23 Jul 2020 02:54:29 -0400
X-MC-Unique: 8PSZ-f0CP2WLVsQwmpLXXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B54380046A;
	Thu, 23 Jul 2020 06:54:28 +0000 (UTC)
Received: from localhost (ovpn-112-185.ams2.redhat.com [10.36.112.185])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2FF471D12;
	Thu, 23 Jul 2020 06:54:24 +0000 (UTC)
Date: Thu, 23 Jul 2020 07:54:23 +0100
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
Message-ID: <20200723065423.GE268427@stefanha-x1.localdomain>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
MIME-Version: 1.0
In-Reply-To: <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0H629O+sVkh21xTi"
Content-Disposition: inline
X-Original-Sender: stefanha@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b="c9YDhwS/";
       spf=pass (google.com: domain of stefanha@redhat.com designates
 205.139.110.120 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
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

--0H629O+sVkh21xTi
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
> On 15.07.20 15:27, Stefan Hajnoczi wrote:
> > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:

Thanks for the responses. It would be great to update the spec with
these clarifications.

> > > If BAR 2 is not present, the shared memory region is not relocatable
> > > by the user. In that case, the hypervisor has to implement the Base
> > > Address register in the vendor-specific capability.
> > 
> > What does relocatable mean in this context?
> 
> That the guest can decide (via BAR) where the resource should show up in the
> physical guest address space. We do not want to support this in setups like
> for static partitioning hypervisors, and then we use that side-channel
> read-only configuration.

I see. I'm not sure what is vendor-specific about non-relocatable shared
memory. I guess it could be added to the spec too?

In any case, since "relocatable" hasn't been fully defined, I suggest
making the statement more general:

  If BAR 2 is not present the hypervisor has to implement the Base
  Address Register in the vendor-specific capability. This can be used
  for vendor-specific shared memory functionality.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200723065423.GE268427%40stefanha-x1.localdomain.

--0H629O+sVkh21xTi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8ZNB8ACgkQnKSrs4Gr
c8hi6QgArR1ztVQRUCI/zFwqALXQy51hWMFUA+NSJfdRpFEYsMrCeF2dvpqW73++
PNSI2bqn1BrDwR8gnA8djoRSTk30D0pCH52U4lXR5CcmErlg/z8eLwNpezNzO2gS
dwIoQUlRHnezozBBbu308MLp9bx7UB9y0Ds0K4n33N7Ntm3rCRDjjIas7nYv9jNs
X67im89ptEIaYQ3dNIOp58RrOl16zjSsWod1nV3BFmBWQFmoiFx+4eVwCf3N9AoE
2Bh3WkTfj4sL53oFdfOlrNVfLrOzbSO+UJRyJK9n01mH+FlJxbJeE81kMgvwyBU+
gTBcaaNYoG9eIM2ea55aX/rOsFc2gg==
=T30T
-----END PGP SIGNATURE-----

--0H629O+sVkh21xTi--

