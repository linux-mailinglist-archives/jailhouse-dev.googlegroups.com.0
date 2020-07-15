Return-Path: <jailhouse-dev+bncBCC7JCUNS4NBBXUIXT4AKGQEGAFOTBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D46220E17
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 15:28:00 +0200 (CEST)
Received: by mail-oo1-xc40.google.com with SMTP id i25sf953817oot.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 06:28:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594819679; cv=pass;
        d=google.com; s=arc-20160816;
        b=M2Kq2uAFttpSufOCqZjTsSMGwQdyNiyXBT1iWzc3EDvMZ3JnxW8rKcVzXMTv3lKcR/
         P8V+1hzPvDvc5M2RvzJPO0wCUnM8TUwlJ2QXPTHA442IpZ5SXL1JO8gYjgt3L8g0F/rq
         Gd52g+iyaBPiE9HwCQmlQt2soAMQB2YgNTNG71g2TyyqmdMprywhCBWvSQKM+D27EMTr
         mY+rQRMJWXpKxR7aQll4dmnuDwKuP9mVl/Qk4+jRVrI4PrjRXJbBsmUz+fpjU3QaO0gq
         e1bk9EpKqE/wEHW/WIW6CuiUo373ABMlTUnkpdmjl86+568IyuTdPL9cbSruc+mdBmA/
         rwTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=AJQlGm2eBfq6mhbFoJa6Z4Koh52jCReVS332bCP4NnU=;
        b=acoWPGjczLbTAseOLW1P4yvDuxfNBd52yphRAazxaKHuzd3aebzEvExGaadFJwP0OG
         EZBmIjeo40wiuw2uei1EZGv6NO2iU44Jzqmi3CXN/1u236dgEoo9DsjsJA15za0iHXk2
         iLPDvZT9yzmq5A08HBTyQ0vSv597ejBWvPtS1iAbdtb1xlwcZeFTZKIleB+yd7aS4u6k
         AtuJxDBcEV/GI2Rf35tAivRgYzonnyav+3gUcoRZcaqBrViCCz/dCu7RUt3njIDxEpdQ
         7IOeqN6tObc6GNjJec60poDZE+PvarKECXlQQ8369Xidff+scqQNymD1JoyL6Dqf+YBN
         kopA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFhdrt0X;
       spf=pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :in-reply-to:content-disposition:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AJQlGm2eBfq6mhbFoJa6Z4Koh52jCReVS332bCP4NnU=;
        b=aEnBcY3KfwLYIUelVGLIbAInvcgiP94RnoWWY7VZCm9oDe0nVeT3uvQTrdTzj3QqWR
         uBvwkyT16Dx9YC94yQjuMJtktgw+bGA+JsNlkL0p8Pq1f75eet4Git54y3NjdjiN17DO
         uJWA2c3sjNV3lah06tlcOyvPYfaSCeNU1Clb7lN8AU3knm38kUMTrFz/ULWp639MvgZI
         FpLzjlp+SdQBCF0n2rpbaUNsdSysotKetyaawFu+l8nV7fMZS74VYSVhzDkuIdSJRvm3
         x7H/KQtv6pLUv/whfTl2LOjsMkfX6qasQDb/r1gS8DsiHjs7l/3K+GAOzCQ8pvrcQIkw
         k8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :references:mime-version:in-reply-to:content-disposition
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AJQlGm2eBfq6mhbFoJa6Z4Koh52jCReVS332bCP4NnU=;
        b=QXDunxFveUM78R79JOeEFkxeFRBHLAzTa1XQHH9RmxcwUK0nZEVJcxC0YjsvgRb1hB
         aD0iB2vKrrhc7dSCQDLoxigvox54vFFJWhUOBMpU2JYJZCxu0N9+OH1VsbHn8gghkZtO
         cDBYfQv1pc9kO1K7asW4DJIIqgkyR2taeyijtaeJAbw6Fps1/LZN14+/sDHJ7xk3Vsre
         uh1oCVsP0HW1Cv25WT+HO8eX141i9myaxSMSaPByBXaAIsx5jSNI0/NFiqy4Yd6CBDYO
         HuT/4CPBHk0YhCytxLARK+WeOwLfconxaep2hc9wXMB9uxSMgc4EpbRTUqRnEsH82Ll3
         Ie4g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532x8KXqTh6zjn5ET0gi7PVNDWUrN9aGfpI0HqZ6Kdlv01XYqAPG
	RBNQXfVWgoPCX5mT4aIUyzM=
X-Google-Smtp-Source: ABdhPJyjYyYgzgLEgRwQi2i97dq9ZnlIW30seJwosFGSFePGgHBFsMD4WlgLmM69LvXiZCO7Quk9Nw==
X-Received: by 2002:aca:3bc1:: with SMTP id i184mr7454981oia.122.1594819678748;
        Wed, 15 Jul 2020 06:27:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:f413:: with SMTP id s19ls484085oih.8.gmail; Wed, 15 Jul
 2020 06:27:58 -0700 (PDT)
X-Received: by 2002:a05:6808:50:: with SMTP id v16mr7748346oic.138.1594819678215;
        Wed, 15 Jul 2020 06:27:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594819678; cv=none;
        d=google.com; s=arc-20160816;
        b=Gyx0IToQJK8uqHGC9UpxoS1brOHALnljV9DT57K5HRS2rtsQHPgtDXqW6Gdj8rIust
         Cos7ndn8OxP56IWO0lGZOlzeNkLTqgZukl4DvwsxjjL0FoTwdiKzWKHA2fCfOTX/zjRc
         iOOD0W6DMkIZSYB/RelERMGrMdBCJxtnskfxdwxaGHkv4J6K9hro+4bnaILmu/tieKTs
         Ee8hKUc+hmrDLGN2UQUtKjZ7oCeNxzRmgymmXmIT8MmJ86kzrq0rI+LIzom5K/puleGa
         +eP7YnOndwNwy/D/f4g2bkXipAQh4eTFpkbL8+3W8edoijq2YOQ8zDoY7gJ0LSduOUy+
         PYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ARuQZeNUyJeazGrLaVL87YovuyuvBqJjoTxtSJ1hx2c=;
        b=Ph6J9QorOXnf10+jmmVzG6Dn9dwdbTeVGTF5XlMbJfifwkBjKzeDoBUHtNtq4HbhB8
         sOTN6TLhSK7raPqWTdGOWqTY9yGcEWpyEDN9nNEPYLuurGK1eJKf6/5QxGwG3hXCrHTz
         WA+8ts4r75WROzhzuXfuDrhEU/dMQWINjEpyAFmZ3YMAZFWBWsJrQ1+NPh+P/B5dm+xH
         ajXyHKevQ4/Ur2EkzY/hlf9HC729Cmsd+yWejZa9/1NVESNNEKLoeGxPcHlHkkdlhMxs
         2lVjWosAnWHsKaE/hszqISrSx/sceCUF6fKvOcBVCGpUOfYj47DC7zdtWOO7QViIIi2T
         5YbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RFhdrt0X;
       spf=pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by gmr-mx.google.com with ESMTPS id h25si110685otk.4.2020.07.15.06.27.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 06:27:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-omuylC_QPI6WBfsgEBVZ_A-1; Wed, 15 Jul 2020 09:27:55 -0400
X-MC-Unique: omuylC_QPI6WBfsgEBVZ_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88C8D1009615;
	Wed, 15 Jul 2020 13:27:53 +0000 (UTC)
Received: from localhost (ovpn-115-22.ams2.redhat.com [10.36.115.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5F5A2B583;
	Wed, 15 Jul 2020 13:27:49 +0000 (UTC)
Date: Wed, 15 Jul 2020 14:27:48 +0100
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
Message-ID: <20200715132748.GA20677@stefanha-x1.localdomain>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
MIME-Version: 1.0
In-Reply-To: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
X-Original-Sender: stefanha@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=RFhdrt0X;
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

--5vNYLRcllDrimb99
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> IVSHMEM Device Specification
> ============================
> 
> ** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE SPECIFICATION! **

Hi Jan,
Thanks for posting this! I have a posted comments where I wasn't sure
what the spec meant.

> The goal of the Inter-VM Shared Memory (IVSHMEM) device model is to
> define the minimally needed building blocks a hypervisor has to
> provide for enabling guest-to-guest communication. The details of
> communication protocols shall remain opaque to the hypervisor so that
> guests are free to define them as simple or sophisticated as they
> need.
> 
> For that purpose, the IVSHMEM provides the following features to its
> users:
> 
> - Interconnection between up to 65536 peers
> 
> - Multi-purpose shared memory region
> 
>     - common read/writable section
> 
>     - output sections that are read/writable for one peer and only
>       readable for the others
> 
>     - section with peer states
> 
> - Event signaling via interrupt to remote sides
> 
> - Support for life-cycle management via state value exchange and
>   interrupt notification on changes, backed by a shared memory
>   section
> 
> - Free choice of protocol to be used on top
> 
> - Protocol type declaration
> 
> - Register can be implemented either memory-mapped or via I/O,
>   depending on platform support and lower VM-exit costs
> 
> - Unprivileged access to memory-mapped or I/O registers feasible
> 
> - Single discovery and configuration via standard PCI, no complexity
>   by additionally defining a platform device model
> 
> 
> Hypervisor Model
> ----------------
> 
> In order to provide a consistent link between peers, all connected
> instances of IVSHMEM devices need to be configured, created and run
> by the hypervisor according to the following requirements:
> 
> - The instances of the device shall appear as a PCI device to their
>   users.
> 
> - The read/write shared memory section has to be of the same size for
>   all peers. The size can be zero.
> 
> - If shared memory output sections are present (non-zero section
>   size), there must be one reserved for each peer with exclusive
>   write access. All output sections must have the same size and must
>   be readable for all peers.
> 
> - The State Table must have the same size for all peers, must be
>   large enough to hold the state values of all peers, and must be
>   read-only for the user.

Who/what is the "user"? I guess this simply means that the State Table
is read-only and only the hypervisor can update the table entries?

> - State register changes (explicit writes, peer resets) have to be
>   propagated to the other peers by updating the corresponding State
>   Table entry and issuing an interrupt to all other peers if they
>   enabled reception.
> 
> - Interrupts events triggered by a peer have to be delivered to the
>   target peer, provided the receiving side is valid and has enabled
>   the reception.
> 
> - All peers must have the same interrupt delivery features available,
>   i.e. MSI-X with the same maximum number of vectors on platforms
>   supporting this mechanism, otherwise INTx with one vector.
> 
> 
> Guest-side Programming Model
> ----------------------------
> 
> An IVSHMEM device appears as a PCI device to its users. Unless
> otherwise noted, it conforms to the PCI Local Bus Specification,
> Revision 3.0. As such, it is discoverable via the PCI configuration
> space and provides a number of standard and custom PCI configuration
> registers.
> 
> ### Shared Memory Region Layout
> 
> The shared memory region is divided into several sections.
> 
>     +-----------------------------+   -
>     |                             |   :
>     | Output Section for peer n-1 |   : Output Section Size
>     |     (n = Maximum Peers)     |   :
>     +-----------------------------+   -
>     :                             :
>     :                             :
>     :                             :
>     +-----------------------------+   -
>     |                             |   :
>     |  Output Section for peer 1  |   : Output Section Size
>     |                             |   :
>     +-----------------------------+   -
>     |                             |   :
>     |  Output Section for peer 0  |   : Output Section Size
>     |                             |   :
>     +-----------------------------+   -
>     |                             |   :
>     |     Read/Write Section      |   : R/W Section Size
>     |                             |   :
>     +-----------------------------+   -
>     |                             |   :
>     |         State Table         |   : State Table Size
>     |                             |   :
>     +-----------------------------+   <-- Shared memory base address
> 
> The first section consists of the mandatory State Table. Its size is
> defined by the State Table Size register and cannot be zero. This
> section is read-only for all peers.
> 
> The second section consists of shared memory that is read/writable
> for all peers. Its size is defined by the R/W Section Size register.
> A size of zero is permitted.
> 
> The third and following sections are output sections, one for each
> peer. Their sizes are all identical. The size of a single output
> section is defined by the Output Section Size register. An output
> section is read/writable for the corresponding peer and read-only for
> all other peers. E.g., only the peer with ID 3 can write to the
> fourths output section, but all peers can read from this section.

s/fourths/fourth/

> 
> All sizes have to be rounded up to multiples of a mappable page in
> order to allow access control according to the section restrictions.

The host's mappable page size? I guess the guest's page size doesn't
matter here.

> 
> ### Configuration Space Registers
> 
> #### Header Registers
> 
> | Offset | Register               | Content                                              |
> |-------:|:-----------------------|:-----------------------------------------------------|
> |    00h | Vendor ID              | 110Ah                                                |
> |    02h | Device ID              | 4106h                                                |
> |    04h | Command Register       | 0000h on reset, writable bits are:                   |
> |        |                        | Bit 0: I/O Space (if Register Region uses I/O)       |
> |        |                        | Bit 1: Memory Space (if Register Region uses Memory) |
> |        |                        | Bit 3: Bus Master                                    |
> |        |                        | Bit 10: INTx interrupt disable                       |
> |        |                        | Writes to other bits are ignored                     |
> |    06h | Status Register        | 0010h, static value                                  |
> |        |                        | In deviation to the PCI specification, the Interrupt |
> |        |                        | Status (bit 3) is never set                          |
> |    08h | Revision ID            | 00h                                                  |
> |    09h | Class Code, Interface  | Protocol Type bits 0-7, see [Protocols](#Protocols)  |
> |    0Ah | Class Code, Sub-Class  | Protocol Type bits 8-15, see [Protocols](#Protocols) |
> |    0Bh | Class Code, Base Class | FFh                                                  |
> |    0Eh | Header Type            | 00h                                                  |
> |    10h | BAR 0                  | MMIO or I/O register region                          |
> |    14h | BAR 1                  | MSI-X region                                         |
> |    18h | BAR 2 (with BAR 3)     | optional: 64-bit shared memory region                |
> |    2Ch | Subsystem Vendor ID    | same as Vendor ID, or provider-specific value        |
> |    2Eh | Subsystem ID           | same as Device ID, or provider-specific value        |
> |    34h | Capability Pointer     | First capability                                     |
> |    3Eh | Interrupt Pin          | 01h-04h, must be 00h if MSI-X is available           |
> 
> The INTx status bit is never set by an implementation. Users of the
> IVSHMEM device are instead expected to derive the event state from
> protocol-specific information kept in the shared memory. This
> approach is significantly faster, and the complexity of
> register-based status tracking can be avoided.
> 
> If BAR 2 is not present, the shared memory region is not relocatable
> by the user. In that case, the hypervisor has to implement the Base
> Address register in the vendor-specific capability.

What does relocatable mean in this context?

> 
> Subsystem IDs shall encode the provider (hypervisor) in order to
> allow identifying potential deviating implementations in case this
> should ever be required.
> 
> If its platform supports MSI-X, an implementation of the IVSHMEM
> device must provide this interrupt model and must not expose INTx
> support.
> 
> Other header registers may not be implemented. If not implemented,
> they return 0 on read and ignore write accesses.
> 
> #### Vendor Specific Capability (ID 09h)
> 
> This capability must always be present.
> 
> | Offset | Register            | Content                                        |
> |-------:|:--------------------|:-----------------------------------------------|
> |    00h | ID                  | 09h                                            |
> |    01h | Next Capability     | Pointer to next capability or 00h              |
> |    02h | Length              | 20h if Base Address is present, 18h otherwise  |
> |    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> |        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
> |    04h | State Table Size    | 32-bit size of read-only State Table           |
> |    08h | R/W Section Size    | 64-bit size of common read/write section       |
> |    10h | Output Section Size | 64-bit size of output sections                 |
> |    18h | Base Address        | optional: 64-bit base address of shared memory |
> 
> All registers are read-only. Writes are ignored, except to bit 0 of
> the Privileged Control register.
> 
> When bit 0 in the Privileged Control register is set to 1, the device
> clears bit 0 in the Interrupt Control register on each interrupt
> delivery.

The Interrupt Control register has not be defined yet at this point in
the spec. Maybe you can rearrange this or include a reference to the
section on the Interrupt Control register.

> This enables automatic interrupt throttling when
> re-enabling shall be performed by a scheduled unprivileged instance
> on the user side.

This last sentence is hard to parse.

I guess the flow is:

1. Guest sets Interrupt Control Bit 0 to 1 to enable interrupts from a
   peer.
2. Peer writes doorbell and the hypervisor clears Interrupt Control Bit
   0 and raises the interrupt.
3. The guest's interrupt handler is scheduled at a later point in time.
   If any additional doorbell writes occur then will not result in
   additional interrupts until the guest sets Interrupt Control again.

Does this mean the peer still takes a vmexit writing to the doorbell
register but the hypervisor ignores the write?

VIRTIO exposes whether notifications are desired in shared memory. That
way the peer can skip the doorbell write entirely (saving a vmexit).
This is a fast approach for software device implementations (slow for
hardware implementations because they would need to do a DMA read).

> 
> An IVSHMEM device may not support a relocatable shared memory region.
> This support the hypervisor in locking down the guest-to-host address
> mapping and simplifies the runtime logic. In such a case, BAR 2 must
> not be implemented by the hypervisor. Instead, the Base Address
> register has to be implemented to report the location of the shared
> memory region in the user's address space.

This paragraph is confusing. There seem to be two concepts:

1. Relocatable memory. Placing shared memory at a fixed addresses
   eliminates the need for address translation. But this seems like a
   security issue if a peer can make me access an arbitrary address, why
   not just use relative addresses from the start of the shared memory
   region?

2. Location of shared memory. BAR 2 is a regular PCI bar and the memory
   is located on the device. In the non-BAR 2 case I think the spec says
   the shared memory is located in guest RAM instead?

> A non-existing shared memory section has to report zero in its
> Section Size register.
> 
> #### MSI-X Capability (ID 11h)
> 
> On platforms supporting MSI-X, IVSHMEM has to provide interrupt
> delivery via this mechanism. In that case, the MSI-X capability is
> present while the legacy INTx delivery mechanism is not available,
> and the Interrupt Pin configuration register returns 0.
> 
> The IVSHMEM device has no notion of pending interrupts. Therefore,
> reading from the MSI-X Pending Bit Array will always return 0. Users
> of the IVSHMEM device are instead expected to derive the event state
> from protocol-specific information kept in the shared memory. This
> approach is significantly faster, and the complexity of
> register-based status tracking can be avoided.

Isn't the PBA just used for masked MSI-X interrupts? That is a standard
MSI-X feature.

On a minimal system that doesn't used masking it makes sense to strip
down the implementation, but I think the spec should allow for PCI
compliance.

> The corresponding MSI-X MMIO region is configured via BAR 1.
> 
> The MSI-X table size reported by the MSI-X capability structure is
> identical for all peers.
> 
> ### Register Region
> 
> The register region may be implemented as MMIO or I/O.

Is that "either MMIO or I/O" or "MMIO and/or I/O"?

Drivers and devices will have to implement both anyway to be compatible
with all other devices and drivers, respectively. But allowing both MMIO
and I/O at the same time ensures that a device will work with any
driver.

> When implementing it as MMIO, the hypervisor has to ensure that the
> register region can be mapped as a single page into the address space
> of the user, without causing potential overlaps with other resources.

Can "page size" be replaced with a specific value like 4 KB? In general
devices shouldn't know about CPU MMU page sizes because they vary.

> Write accesses to MMIO region offsets that are not backed by
> registers have to be ignored, read accesses have to return 0. This
> enables the user to hand out the complete region, along with the
> shared memory, to an unprivileged instance.
> 
> The region location in the user's physical address space is
> configured via BAR 0. The following table visualizes the region
> layout:
> 
> | Offset | Register                                                            |
> |-------:|:--------------------------------------------------------------------|
> |    00h | ID                                                                  |
> |    04h | Maximum Peers                                                       |
> |    08h | Interrupt Control                                                   |
> |    0Ch | Doorbell                                                            |
> |    10h | State                                                               |
> 
> All registers support only aligned 32-bit accesses.
> 
> #### ID Register (Offset 00h)
> 
> Read-only register that reports the ID of the local device. It is
> unique for all of the connected devices and remains unchanged over
> their lifetime.

What is the purpose of the ID?

> #### Maximum Peers Register (Offset 04h)
> 
> Read-only register that reports the maximum number of possible peers
> (including the local one). The permitted range is between 2 and 65536
> and remains constant over the lifetime of all peers.
> 
> #### Interrupt Control Register (Offset 08h)
> 
> This read/write register controls the generation of interrupts
> whenever a peer writes to the Doorbell register or changes its state.
> 
> | Bits | Content                                                               |
> |-----:|:----------------------------------------------------------------------|
> |    0 | 1: Enable interrupt generation                                        |
> | 1-31 | Reserved (0 on read, writes ignored)                                  |
> 
> Note that bit 0 is reset to 0 on interrupt delivery if one-shot
> interrupt mode is enabled in the Enhanced Features register.
> 
> The value of this register after device reset is 0.

This is a global interrupt enable/disable for all vectors?

> #### Doorbell Register (Offset 0Ch)
> 
> Write-only register that triggers an interrupt vector in the target
> device if it is enabled there.
> 
> | Bits  | Content                                                              |
> |------:|:---------------------------------------------------------------------|
> |  0-15 | Vector number                                                        |
> | 16-31 | Target ID                                                            |

s/Target ID/Peer/ ?

> 
> Writing a vector number that is not enabled by the target has no
> effect. The peers can derive the number of available vectors from
> their own device capabilities because the provider is required to

What is the "provider"? The hypervisor?

> expose an identical number of vectors to all connected peers. The
> peers are expected to define or negotiate the used ones via the

s/ones/vectors/ is clearer

> selected protocol.
> 
> Addressing a non-existing or inactive target has no effect. Peers can
> identify active targets via the State Table.
> 
> Implementations of the Doorbell register must ensure that data written by the
> CPU prior to issuing the register write is visible to the receiving peer before
> the interrupt arrives.

Physical devices have no control over CPU memory ordering. Normally the
drivers have the necessary memory barriers. Why is it the device's
responsibility to do this in IVSHMEM v2?

> 
> The behavior on reading from this register is undefined.
> 
> #### State Register (Offset 10h)
> 
> Read/write register that defines the state of the local device.
> Writing to this register sets the state and triggers MSI-X vector 0
> or the INTx interrupt, respectively, on the remote device if the
> written state value differs from the previous one. Users of peer
> devices can read the value written to this register from the State
> Table. They are expected differentiate state change interrupts from
> doorbell events by comparing the new state value with a locally
> stored copy.

Does this mean drivers using INTx must compare the state table entries
for their peers on each interrupt to differentiate from doorbell events?
That seems inefficient.

> 
> The value of this register after device reset is 0. The semantic of
> all other values can be defined freely by the chosen protocol.
> 
> ### State Table
> 
> The State Table is a read-only section at the beginning of the shared
> memory region. It contains a 32-bit state value for each of the
> peers. Locating the table in shared memory allows fast checking of
> remote states without register accesses.
> 
> The table is updated on each state change of a peers. Whenever a user
> of an IVSHMEM device writes a value to the Local State register, this
> value is copied into the corresponding entry of the State Table. When
> a IVSHMEM device is reset or disconnected from the other peers, zero
> is written into the corresponding table entry. The initial content of
> the table is all zeros.
> 
>     +--------------------------------+
>     | 32-bit state value of peer n-1 |
>     +--------------------------------+
>     :                                :
>     +--------------------------------+
>     | 32-bit state value of peer 1   |
>     +--------------------------------+
>     | 32-bit state value of peer 0   |
>     +--------------------------------+ <-- Shared memory base address
> 
> 
> Protocols
> ---------
> 
> The IVSHMEM device shall support the peers of a connection in
> agreeing on the protocol used over the shared memory devices. For
> that purpose, the interface byte (offset 09h) and the sub-class byte
> (offset 0Ah) of the Class Code register encodes a 16-bit protocol
> type for the users. The following type values are defined:
> 
> | Protocol Type | Description                                                  |
> |--------------:|:-------------------------------------------------------------|
> |         0000h | Undefined type                                               |
> |         0001h | Virtual peer-to-peer Ethernet                                |
> |   0002h-3FFFh | Reserved                                                     |
> |   4000h-7FFFh | User-defined protocols                                       |
> |   8000h-BFFFh | Virtio over Shared Memory, front-end peer                    |
> |   C000h-FFFFh | Virtio over Shared Memory, back-end peer                     |
> 
> Details of the protocols are not in the scope of this specification.

If I understand correctly the reason for creating IVSHMEM v2 is to
support non-VIRTIO devices? If you just want VIRTIO devices then IVSHMEM
v2 + VIRTIO is more complex than a pure VIRTIO solution. But if you
don't want VIRTIO then IVSHMEM + a minimal device can be simpler than
VIRTIO.

Stefan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715132748.GA20677%40stefanha-x1.localdomain.

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8PBFQACgkQnKSrs4Gr
c8hQ2Qf/aXiZ1PCvABaXKoW7kpRn6MrNLkBsM6rCFYJ/Z0Rl0MTgcW18LqvdH8bP
xImxp2YpCery5R3YqM0CoqgBc1eqC3G6hAYo52EuHWOkzDYsbCaNtUggNvHWOSMF
rhd+MgArLSIpeYRmFkRLzkL/wYdXrrTvPbQwkPkdqiiYQRuCAen6Aa2ZfVWZlyc2
jg+iP1N+XunzYrSs7CxA4hOI7A2zsqnkT0Uj8rSANKz/cNSeaAZJEyiDlby0U1ES
dgGc/u5ZQ/N3i/Hald2NWqj+BoJ6cDFmMI3h2vKrlNGjkRhF6wBXY8vYGcecXN51
is1TQ3g0e4MVOjkfqqM/sRacU4tpfg==
=I4NV
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--

