Return-Path: <jailhouse-dev+bncBCQYDA7264GRB7WE7P4AKGQEQG6JISI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93c.google.com (mail-ua1-x93c.google.com [IPv6:2607:f8b0:4864:20::93c])
	by mail.lfdr.de (Postfix) with ESMTPS id F165822EFD1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 16:19:43 +0200 (CEST)
Received: by mail-ua1-x93c.google.com with SMTP id h88sf5274444uah.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 07:19:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595859582; cv=pass;
        d=google.com; s=arc-20160816;
        b=uB2lQzzM8a1ctYVC16QAaUSh75FziP4lnQldcmSPRomWxpM6Phpz7uwX/bI/6isz9H
         gyoJJ6Q/1JsBPsPyQawQLPAxZb7l16FeKcpvn6BzvUeA7av8vOvZv4DzTokLkFt8WQnh
         By9sSbxA0iod7p/grDOUwdatikJAM/Z7SQ/3LYwHFY6Zk5nfu6xcJpNkC2MuD801VmPV
         obN/UvvIRqGUHcqBURLbFPpH3zjPh7SOzFimyykikJbCVcFruN9oUFEu5Am6H3ZX07id
         DupNGHZVPFDK/HUOfqGzM+AGp4YHhHRPZHdtCVNUbyDFUZXdtS8Vdf3WD1ii+IlJaARP
         NByA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=VoLf/9pL2DR1T55FRiGhVO2Ym9AS5IbBAdvMNq/Y20M=;
        b=G+8S7QQJqHmZsSW0ZowuPVZO/MwJnj0fkRLLWqHeS04zwW24vYxex/NOsBgJ2bVwqs
         nC5fuQuRQbLYcMbnJHpV6xjPAsBNT8e4z3G05oAERfefHscJslTyIqNAY0yOK1TjM0BC
         KX8yoFxm3au2N5jWzVG2SjAVAN4PLF55VTmPvp9Dr187nlia8hq/6kDj7x8QmSd4/9DA
         b9SaMJdTzVJAvW2Ln/PdzfHyEGTxmYTLxuJUGnb6waB7EFD8Hd720opDuz7yFy7DVHMd
         c+umZmtB+eO4TAUtyvKbKNTqTWw72Ke6Zo3l2T14DgLOlE3MnstsiS7SjAvR+y7pKu/Y
         UCng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uuyb6tjQ;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VoLf/9pL2DR1T55FRiGhVO2Ym9AS5IbBAdvMNq/Y20M=;
        b=Lw46JdvpLHOui6rWamj+HU+3iVC1qcBWqu+hQ/V87fVRDROdkiG3VQZOmI5XN2ezd8
         Dn+zbcgEHG4PTlZ8mLPOr0SpSN/tDLGqKJeHuLn6pEt0y5IiRzBkEI7ZfaohVKCiXtbG
         FAopkuEUi3DZlCUFJjtVZgSepDQTRxD9BviVmI8Aue8mi2Op36mhWU/ENHYLhwNdJHSD
         V5riSQqvvM9F0P2XyPv5BPmdgHzevPwNmJmp3Hr+Twh2SDjUri1sBPdtKGiePbWuFn6O
         vO5kNRuZ2YNCPZ8OGj33fo/eqLKk/8u3j4sQdmyPBeV6EMbjfSs/qYc7VwCipsT7+K08
         vxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VoLf/9pL2DR1T55FRiGhVO2Ym9AS5IbBAdvMNq/Y20M=;
        b=H85QJh45lZSMqBKvIDDHjcRP8D6aeXn/lut9wwzkkCWxjqkxNQ9GDeP0PLLjgmXWQC
         /DPyYp9zkLVQZLbbYsHdCdAUFqxgP9kC0ApbzUBFS8BWn62ffxdGwWjbQs/nqYESDiuJ
         mcBpAI51TSuxpm168I/WAiqTAZj5op6F8SJwXRvTKhj/icwinAe6cVWEri1whibSeM0K
         sT6qRspv3ybzz6PYWxJGJTSrUn66STckF+CdT6c17zje+CgatCWwFfGlpRvcRauCJmPT
         W2AexlA5BUQkQKXFIT1nZ0MCKmJzBgq78Rx/GT5zb9OvC0uvXNiTXJcYwbJ5P8WeNseM
         9FsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/piNNlU9rAoTW6craTwpBZr3sUG8pR+MfnuitolxRzTk99QDz
	4sFWyjwIhqBSuLsOT3taKC8=
X-Google-Smtp-Source: ABdhPJyU2VKEmk9myOgItAPfT+pbT+5bGRnJZfwgG5xBAqMVOv5ssvUND5MD59YrxexHv9kvwkMZVg==
X-Received: by 2002:ab0:2408:: with SMTP id f8mr15997639uan.91.1595859582714;
        Mon, 27 Jul 2020 07:19:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:55c6:: with SMTP id w6ls497228uaa.1.gmail; Mon, 27 Jul
 2020 07:19:42 -0700 (PDT)
X-Received: by 2002:a9f:22c4:: with SMTP id 62mr16443225uan.135.1595859582070;
        Mon, 27 Jul 2020 07:19:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595859582; cv=none;
        d=google.com; s=arc-20160816;
        b=MoGZc/+eoUBJmztVIpKvMEEFIK3H7Stlnh130mU/01yQ/unm8jQ5T1hEHrkez98g08
         8oecr1jDnChUGTBQZNbm/Oh8skrJ1XM4jPT2jbWeZQf7Xeh6cfzrBwDIYKVwglSgwjqZ
         a331yAZgwqHYC4y55wSFDuBHvWicwAjKHueNtv0gpVCMA1ZgvUKrChzcEm8sP2tpFc0n
         ln8zLv4A9TGc/0uFmxz8lut2BBcUk6rFfH87wT2LQ2meySvRjYPIEmhnM7CuaBaNPTzC
         x4uLdkMocqvalOzFrGsCXVzt1fly4+11yOLwR8FnW5tnYq7Y2x8LOfIjet5NryFFY5Ja
         I4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=4KatCUtUi43U46Atl2lq5BZU0nb0mygjLHB1Uv+pzig=;
        b=seAUs1LpwlIeQ0PMosHLTkgCM8ykliUP/xBK/EM4uh+jcW1IZhF+VpMIZglzRBJvrS
         wmUkSVipOuOIM1Y9cljPDzn2iwaTupFpTp1xMPnksN+GjfConUuoKltCYyCB1bgU4K6D
         GzGETSmArz+ZVXZOLTmaVuhQRaXh7USLZouwj0J5OyCxlVVAnLzfeRxfscn5wShW5pKL
         Ji9NVbcZUuYFantCDPUyvd6OGyMKZyl74GGgVaDwZ2+z8lj0+JQ8kzbEoY0l4M7M+kBx
         ww7WX1KRahap2DavEO9eerXUzMdvSAo4eax6TyddDjZCW9q7seR37jTlze96Mhrw7YKo
         mSFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Uuyb6tjQ;
       spf=pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by gmr-mx.google.com with ESMTPS id v25si296277vsm.1.2020.07.27.07.19.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 07:19:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-ZusGMT-QM6ul6d9eXv0NFA-1; Mon, 27 Jul 2020 10:19:40 -0400
X-MC-Unique: ZusGMT-QM6ul6d9eXv0NFA-1
Received: by mail-wr1-f72.google.com with SMTP id z1so3989164wrn.18
        for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 07:19:39 -0700 (PDT)
X-Received: by 2002:adf:cf10:: with SMTP id o16mr18915799wrj.380.1595859578503;
        Mon, 27 Jul 2020 07:19:38 -0700 (PDT)
X-Received: by 2002:adf:cf10:: with SMTP id o16mr18915785wrj.380.1595859578277;
        Mon, 27 Jul 2020 07:19:38 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id s20sm7334140wmh.21.2020.07.27.07.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:19:37 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:19:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	liang yan <lyan@suse.com>
Subject: Re: [virtio-comment] Re: [RFC] ivshmem v2: Shared memory device
 specification
Message-ID: <20200727101824-mutt-send-email-mst@kernel.org>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200727091802-mutt-send-email-mst@kernel.org>
 <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
 <20200727095239-mutt-send-email-mst@kernel.org>
 <ac7ceefb-99d8-0662-8863-c90c20b2f31a@siemens.com>
MIME-Version: 1.0
In-Reply-To: <ac7ceefb-99d8-0662-8863-c90c20b2f31a@siemens.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=Uuyb6tjQ;
       spf=pass (google.com: domain of mst@redhat.com designates
 205.139.110.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Mon, Jul 27, 2020 at 04:17:06PM +0200, Jan Kiszka wrote:
> On 27.07.20 15:56, Michael S. Tsirkin wrote:
> > On Mon, Jul 27, 2020 at 03:39:32PM +0200, Jan Kiszka wrote:
> > > On 27.07.20 15:20, Michael S. Tsirkin wrote:
> > > > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> > > > > #### Vendor Specific Capability (ID 09h)
> > > > > 
> > > > > This capability must always be present.
> > > > > 
> > > > > | Offset | Register            | Content                                        |
> > > > > |-------:|:--------------------|:-----------------------------------------------|
> > > > > |    00h | ID                  | 09h                                            |
> > > > > |    01h | Next Capability     | Pointer to next capability or 00h              |
> > > > > |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
> > > > > |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> > > > > |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
> > > > > |    04h | State Table Size    | 32-bit size of read-only State Table           |
> > > > > |    08h | R/W Section Size    | 64-bit size of common read/write section       |
> > > > > |    10h | Output Section Size | 64-bit size of output sections                 |
> > > > > |    18h | Base Address        | optional: 64-bit base address of shared memory |
> > > > > 
> > > > > All registers are read-only. Writes are ignored, except to bit 0 of
> > > > > the Privileged Control register.
> > > > 
> > > > 
> > > > Is there value in making this follow the virtio vendor-specific
> > > > capability format? That will cost several extra bytes - do you envision
> > > > having many of these in the config space?
> > > 
> > > Of course, this could be modeled with via virtio_pci_cap as well. Would add
> > > 12 unused by bytes and one type byte. If it helps to make the device look
> > > more virtio'ish, but I'm afraid there are more differences at PCI level.
> > 
> > I guess it will be useful if we ever find it handy to make an ivshmem
> > device also be a virtio device. Can't say why yet but if we don't care
> > it vaguely seems kind of like a good idea. I guess it will also be handy
> > if you ever need another vendor specific cap: you already get a way to
> > identify it without breaking drivers.
> > 
> 
> I can look into that. Those 12 wasted bytes are a bit ugly, but so far we
> are not short on config space, even in the non-extended range.
> 
> More problematic is that the existing specification of virtio_pci_cap
> assumes that this describes a structure in a PCI resource, rather than even
> being that data itself, and even a register (privileged control).
> 
> Would it be possible to split the types into two ranges, one for the
> existing structure, one for others - like ivshmem - that will only share the
> cfg_type field?

Sure.

> > 
> > > I do not see a use case for having multiple of those caps above per device.
> > > If someone comes around with a valid use case for having multiple,
> > > non-consequitive shared memory regions for one device, we would need to add
> > > registers for them. But that would also only work for non-BAR regions due to
> > > limited BARs.
> > 
> > 
> > OK, I guess this answers the below too.
> > 
> > > > Also, do we want to define an extended capability format in case this
> > > > is a pci extended capability?
> > > > 
> > > 
> > > What would be the practical benefit? Do you see PCIe caps that could become
> > > useful in virtual setups?
> > 
> > So if we ever have a huge number of these caps, PCIe allows many more
> > caps.
> > 
> > > We don't do that for regular virtio devices
> > > either, do we?
> > 
> > We don't, there's a small number of these so we don't run out of config
> > space.
> 
> Right. But then it would not a be a problem to add PCIe (right before adding
> it becomes impossible) and push new caps into the extended space. And all
> that without breaking existing drivers. It's just a cap, and the spec so far
> does not state that there must be no other cap, neither in current virtio
> nor this ivshmem device.
> 
> Jan

Right.


> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200727101824-mutt-send-email-mst%40kernel.org.
