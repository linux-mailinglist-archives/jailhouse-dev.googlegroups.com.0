Return-Path: <jailhouse-dev+bncBCQYDA7264GRBH527P4AKGQERI3STPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id A206222EE03
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 15:56:49 +0200 (CEST)
Received: by mail-pl1-x640.google.com with SMTP id 41sf3890368plb.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jul 2020 06:56:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595858208; cv=pass;
        d=google.com; s=arc-20160816;
        b=IT2RXGQzsh7eSGNkqfpapTQXc/YrJmKMOiNIHULp/30FQsE9pAUlnEmUXcBw9EXI2n
         F1+MvS2qsagUGS0IiZtBFUCJRLmuRcH9QVhyuszhnfyjcLuQFTcHONVo6/5PLXoBvX6B
         GTPfSjeHRbeDb0nRqqSVsRWzqL3jPDDS7pWqPbqAPhLoSdhmsH4iMV2fs7cLj/YC1fti
         7i9afYZL8Z55S7a9Ius4FCBI2ROnQoTTRelugurGieDUstSOiVv6iExqPfnAJdWOpHqZ
         ylCVxzqgBphRn1tXrDMxqE5+bI4Ir7El7pLUjnndoafIj4/koiAoigdeuZ5LoD8VQ39y
         Jfgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=DiczJHyxANHmEkn+T/JAg9j7UNukqVShtGTo9CVII7o=;
        b=w1ugMqZxJUov1cb0Aj9yBT2Q4XgCJ5sxgs2EnCt51AUlbk6b5HWJraGVCbUWChPLL+
         qHXz9aqKmd1uwDCZJr030CGEXb2TrtL6XR7kM5TiyZq4486bnKWXJ8zk/lAhQT/Bv6mk
         ckaQZYOAGkZwZqdlygefQ+I3I9tskUp5vDJjDx5sSwpMop2KBXGK0MMEHoYrM0a+SHG5
         Zv4+bSu2v5A6d6elBA2DJC6u3bXwZs2GRxV6dl7zZnbMFrC4eLGHRB2xA5su3VutJ8hT
         bv3kBfvvYqiE8X1St/6ZfXAb47jO2hBsbcvIhOrndiaFLglMreLUE4/4Q2bGBgAuLwnD
         jktQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BVxzRCEv;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DiczJHyxANHmEkn+T/JAg9j7UNukqVShtGTo9CVII7o=;
        b=Nk0o4Yzyhfnd5mCQ2o5hnOdI62y5I5fu2BUFrIGCK90DpaH+fqSgh4aU+ZmvduahYk
         D4bHI6Ji6Z+FpanMe9anlMiNovUI7MYeCiB8QzHn1tMZZSnj9WdBN/99psoAjM46B1yb
         RQ5NnN4QGDdmuKYyYUxUQd+inE3fbN1mWMXeTHAwCKQuy1x5bl8beZUyOt9OsKPUu+7s
         4XHJbM0gbvIoDj3hBbZpx4dhdZKnia5A5o9ayi41gDz5dXrH78H4JOpT07ucXX3ryEhV
         QFeEN27g9P/RW95svoRv+lmTtgoBjHo1/+4JyBTIVe9NhK+7bYneS8Tc/F/Gf7JJa093
         7xBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DiczJHyxANHmEkn+T/JAg9j7UNukqVShtGTo9CVII7o=;
        b=JF5CIrG149WrllPowaL6BpAqMew1dsm53gbE+VZQ07ukU48DIC94aKQpLxvRFSEpVB
         b+5fpqgdXtqMYhBdKBK9zakNkjJCgzWtczLYTlHeOVUKx+G0Uf48M1UAdp4t8lr7KazO
         urtQ1brKRxxZQh+UDcf8cQBDfb20AYzIQnK8dzYs3PisWsHZ6I85aseENE1yXScIU7bw
         xyKW5fFQ2EecIsKVf1klMGqjstncNZkYvLNziozIN9/dudqJD3pO1dl9HKAdXuDU03xi
         36qrM8rOpNBw5WcvIszrEBB2GbO/qGCh6TQr4jIkwotirVuugFRg2tb4Kdx8empC85Zy
         pWwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533e6qTWL0IxGJpUoGHfkv9NIG+Ko/jNOIt+HcZEEGZSGO5n4pl8
	7OneT68OkCOkmL+Hj9sQyH4=
X-Google-Smtp-Source: ABdhPJzW0W01D53pcw81QOLdQZU1xGQ8SbKRs+J+bj9KlU0dU1FHyE7DSdXO+WM8feJ9Vq3PojAJUQ==
X-Received: by 2002:a65:484c:: with SMTP id i12mr20844560pgs.145.1595858208205;
        Mon, 27 Jul 2020 06:56:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:130a:: with SMTP id h10ls2033255pja.0.canary-gmail;
 Mon, 27 Jul 2020 06:56:47 -0700 (PDT)
X-Received: by 2002:a17:90a:4fa2:: with SMTP id q31mr20088458pjh.178.1595858207593;
        Mon, 27 Jul 2020 06:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595858207; cv=none;
        d=google.com; s=arc-20160816;
        b=JeublJzqtOvXPIQQCkNKWjlML46cT6dwOKrgHw1nRZyFGGJ/8e/fwgVmpB8tZJTt+4
         5BxRA/PBGbJdwpcg0qyvmHtGlj9mm01Soe+n5OxenidNMsjetiiRr+ivMPK/m73rmsmA
         WI3TjxYws59iYmCW0w8suohtqoewYREKaFEYApA+OhRSKKsznzAXfIMvRE89YgjPLnRL
         sD5WlX1yEBXZqxM5CsfX0ofZ4ImWvaEWdTD9cn+8EQ8hqkbBF6sUZxzRjVZpB4bVi6WS
         +XflEkM77+Wx6MYak705kexytT9fmv773RMNX/WMiFoRgBGASbAXxBjTcKqXUxxye/Y5
         /CBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yIyUbH3TjxBkeCeiM81IwjmoKyB0WfEoMp0lKATPcA8=;
        b=V0OAollWc0zuqq1nRkB3T6amDCfJZp4AOxfh4ueac6kLrtc3EJYBQRmUvOrZyxpSET
         FK9C9M9z7er72Rhw9TbgIC7lUDj1b4x9C0CzEe5tXZtNHJlz8V5OEhDeiDPyQEyJWMVg
         DLUTCBU4xbPOEpaDe/3JHbd5eyIUOryCremS7hrQMyEruIR5tXK80eytgPqWVS/c21Y0
         9oNJQzRnankaue7znbgm7AXhXAWkwrMgmDCFczIt8sTpb36y+KrV4V1xUJWPxZv5DDKJ
         vDtsbUGFzLxc3vnRF9gx+FDgssnYzn3UomEOTG8Xb+0bM8QNjKknCl8/lJpnpTriA0ac
         FJVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BVxzRCEv;
       spf=pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by gmr-mx.google.com with ESMTPS id n68si786050pgn.1.2020.07.27.06.56.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:56:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-1bzYRzrhO9CyZH7XjwLOzw-1; Mon, 27 Jul 2020 09:56:45 -0400
X-MC-Unique: 1bzYRzrhO9CyZH7XjwLOzw-1
Received: by mail-wr1-f69.google.com with SMTP id 89so3965054wrr.15
        for <jailhouse-dev@googlegroups.com>; Mon, 27 Jul 2020 06:56:45 -0700 (PDT)
X-Received: by 2002:a5d:6990:: with SMTP id g16mr19928610wru.131.1595858203877;
        Mon, 27 Jul 2020 06:56:43 -0700 (PDT)
X-Received: by 2002:a5d:6990:: with SMTP id g16mr19928600wru.131.1595858203636;
        Mon, 27 Jul 2020 06:56:43 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id j8sm13171857wrd.85.2020.07.27.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 06:56:42 -0700 (PDT)
Date: Mon, 27 Jul 2020 09:56:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jailhouse <jailhouse-dev@googlegroups.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	liang yan <lyan@suse.com>
Subject: Re: [virtio-comment] Re: [RFC] ivshmem v2: Shared memory device
 specification
Message-ID: <20200727095239-mutt-send-email-mst@kernel.org>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200727091802-mutt-send-email-mst@kernel.org>
 <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
MIME-Version: 1.0
In-Reply-To: <85f69f31-e4c6-e7af-1fa5-90e5a2c81ae8@siemens.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Original-Sender: mst@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=BVxzRCEv;
       spf=pass (google.com: domain of mst@redhat.com designates
 207.211.31.120 as permitted sender) smtp.mailfrom=mst@redhat.com;
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

On Mon, Jul 27, 2020 at 03:39:32PM +0200, Jan Kiszka wrote:
> On 27.07.20 15:20, Michael S. Tsirkin wrote:
> > On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> > > #### Vendor Specific Capability (ID 09h)
> > > 
> > > This capability must always be present.
> > > 
> > > | Offset | Register            | Content                                        |
> > > |-------:|:--------------------|:-----------------------------------------------|
> > > |    00h | ID                  | 09h                                            |
> > > |    01h | Next Capability     | Pointer to next capability or 00h              |
> > > |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
> > > |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> > > |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
> > > |    04h | State Table Size    | 32-bit size of read-only State Table           |
> > > |    08h | R/W Section Size    | 64-bit size of common read/write section       |
> > > |    10h | Output Section Size | 64-bit size of output sections                 |
> > > |    18h | Base Address        | optional: 64-bit base address of shared memory |
> > > 
> > > All registers are read-only. Writes are ignored, except to bit 0 of
> > > the Privileged Control register.
> > 
> > 
> > Is there value in making this follow the virtio vendor-specific
> > capability format? That will cost several extra bytes - do you envision
> > having many of these in the config space?
> 
> Of course, this could be modeled with via virtio_pci_cap as well. Would add
> 12 unused by bytes and one type byte. If it helps to make the device look
> more virtio'ish, but I'm afraid there are more differences at PCI level.

I guess it will be useful if we ever find it handy to make an ivshmem
device also be a virtio device. Can't say why yet but if we don't care
it vaguely seems kind of like a good idea. I guess it will also be handy
if you ever need another vendor specific cap: you already get a way to
identify it without breaking drivers.


> I do not see a use case for having multiple of those caps above per device.
> If someone comes around with a valid use case for having multiple,
> non-consequitive shared memory regions for one device, we would need to add
> registers for them. But that would also only work for non-BAR regions due to
> limited BARs.


OK, I guess this answers the below too.

> > Also, do we want to define an extended capability format in case this
> > is a pci extended capability?
> > 
> 
> What would be the practical benefit? Do you see PCIe caps that could become
> useful in virtual setups?

So if we ever have a huge number of these caps, PCIe allows many more
caps.

> We don't do that for regular virtio devices
> either, do we?

We don't, there's a small number of these so we don't run out of config
space.

> 
> Thanks,
> Jan
> 
> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200727095239-mutt-send-email-mst%40kernel.org.
