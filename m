Return-Path: <jailhouse-dev+bncBCTYL35VU4JBBG6NUPXQKGQEZK6O7UA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3c.google.com (mail-io1-xd3c.google.com [IPv6:2607:f8b0:4864:20::d3c])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081C113FF4
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Dec 2019 12:14:36 +0100 (CET)
Received: by mail-io1-xd3c.google.com with SMTP id e124sf2131928iof.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 03:14:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575544475; cv=pass;
        d=google.com; s=arc-20160816;
        b=y3puSUJqePPMtibMpdkln5HcLzHlnS7S37HiUCnnotCwACEuoIqLW1mdWeGuysWWOg
         wmAdDtrAHuRkBTMhjzN84I3ihioZ78OHyF/x4KhpA6JaWgn7GpWY7yXwR3e5zG24whJw
         g/cwd9EKFmKZ2MmVTVAxAqkFo3+t26OdHcpX81m43GPaR6/bmRAh0+CWwF0+Gwl1Q7Yl
         A6k8tV4+FJmkl8RfCLwWYaXR5X+wjwuVmZX/2lNcQLn2tmZ6qOzwUIbDXMAEx4/gBW8t
         W+mPr7FUEVm77PQlAzLzLKhPZV9/IKe39kL14xXt3b/XRG1YyIRzorI7g/CKWUYK04lX
         qZng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:sender
         :dkim-signature;
        bh=FjMNdSg55CoIPeVarZUVofhkpH9rU17D9tb+YCYLI1E=;
        b=M9HO83rT2O4mpuPaziKTEHcda7qJMAp2URNGjN0wLqabs6Vj34+vMP3IdB3AflYDZ5
         EEdM5UyeHuJTBkEhc/ThfiZ+REWtXGoxZVRG2c1HafOrYtRSd3llMMyBJxY85J5ym6ln
         FEiSSpebQg9OtUxy8EzyhHn0WRUR7W0FBsZfmhVp329rUbcyjFJzKj0XsL6d1kPEsZfh
         qmzaTi+UQ1vKp/8r3MjV6/PVzlwqgE0pEKCLYnIP9K8sITrr6L/VfmpmHMznZSbqSrMK
         +8rSEPSm24XNJmzMbZtaLELqrjKZFPo/gb0dGW22B+E25pHbMtMxtb3QVuO+ZFnwTiuq
         HE6w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvMWrQmE;
       spf=pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FjMNdSg55CoIPeVarZUVofhkpH9rU17D9tb+YCYLI1E=;
        b=fH5HYCNJQ2wInzhbmOWMJFnahjeXBihVgw0XNvVnz3E8oRpy06OVkDXrqNqFZbyyCO
         NRcCVIhRVDGxYoC/yWeUMZjAaDfu5LtINVZCZTWeskjwmu+6oqoVZ9ztpisgr+wNpxuv
         rxug4L//gIuYS3BbS/4T3HZPtsJd3rQmN6V6z9ajGa2yJpdmK9aKsnvR/NG1pMMuq9Dg
         8CjNBmCimmPvoBIHzkQPGx0T22pt5aJf14Jo3CB7E8V30QnwdENYJR8XyNFEU5BeZrxA
         TaiyAtQvAStmrG3/PLE5dVcnJ2cE0GEDjROS9KpBfNBUbsLL7iUNWD69gY8ndQWmen6t
         BoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:references:date
         :in-reply-to:message-id:user-agent:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FjMNdSg55CoIPeVarZUVofhkpH9rU17D9tb+YCYLI1E=;
        b=d4h0mEhP7ipSdIWJ4r0irykPE6JQA6NXX/9Wg33u/LJhAOucmYBxtyo2GhErOL49Wx
         T1jf7fKxmNJRwyQbjIM3UGtSUJbPGlRkhSu/95B1/zAm0ARWYQtPGbvExNhXgauH9wHl
         XxT1Uocv0VvfWFTQQTz/8HzziQsn54Od5eFa1brzuVATS8Jiea2/U2ea9nOKgWZLa/WR
         fHYn5QYmJSQTSNaTOgBq5NNcttiO2G11P+mLKEkQ/GA5wAda49ZuFVMJ/X0984wwE/kM
         6c0iSItXoYxWTLq8tq0tN2i6gLtKK6tdSE5Ws4GVTeybkLmfOqDdhy9HMII0CK7qHo2B
         ZBrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXXtixTeZwAYUH9we6DLaLvD3Qi6JpqLrBOTKXg1h6OnpcgudjK
	VCRqhsUV/c/CcXU4ZJ5SgZs=
X-Google-Smtp-Source: APXvYqwISYwxz0W+gYCrmxfFehLdC3T39+NDWyq0OJR9ti998++9T8ZilVK28odjCxq74qlT9Qw5xA==
X-Received: by 2002:a92:d30e:: with SMTP id x14mr7376249ila.108.1575544475412;
        Thu, 05 Dec 2019 03:14:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5e:8b4a:: with SMTP id z10ls360373iom.12.gmail; Thu, 05 Dec
 2019 03:14:34 -0800 (PST)
X-Received: by 2002:a6b:6202:: with SMTP id f2mr5616964iog.272.1575544474673;
        Thu, 05 Dec 2019 03:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575544474; cv=none;
        d=google.com; s=arc-20160816;
        b=lIXRnXomRqsrIKdAY7KJiQn+Yz/92afoZF/yhfIg2BquDMWjEavtDvdm5QPfOH9woX
         etqKPxtFWxjMPZG0x8O6DtgkFmGaUg6ZK+NgiqYoZ2HO1zK4cUEhLRJOGDCAlS1IqtOe
         sV+F+xqy5V6bsPn/23jghn5IdGGEOdJnM3MLV43bGPbOOsRGwnFYLg+cpRo9fEgT7N8N
         A8CaDXgsshZXQ9GmQ46VcBHNNjIzsyzh+cjVUrKqsxgLY4sgSZdA4F1WoB4YJ+m2PD+V
         JX5TIkFat0yLSi2hZnm4AeHKNOMOXWoA7x4ZnCAY1qRf+iKWJVFeo72RXByEdBv4FCa5
         LpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:date:references:subject:cc:to:from:dkim-signature;
        bh=Rgb8euoYFnCAZsAcXHn/xvyr0PLr2EPPClKi016CL2E=;
        b=EG2eXHZbvn5Kas3OGZ+w6ybC3FbViYg1OVWwIT7wosN4S2B1wdbNblnvfkjgbPDvTS
         mXPOoq4kbvxMlhyNcyD48TEJS95JdDbsWWJOoO2fyQ7vvQHs5lFNkVehzRMUAJ4YxSW1
         GEnaIT6JpeVGmuXOpL1mHsE3geVh8ufqU64xg6qjZOQMttRmMhoha0ZxMjRSX1hsZOxB
         aTIVnQqVxa5yi5z3DM+earnVddf+UAUL3XbTGD8qIaU7IDKc2E7/SZl3USpvpP8CMw29
         yIh7Nx8PTnudHp5sp1ngISKi+8jNdnxMGVrP4oi3niC5aj0Rlp5WE7PJFTCmdbMwq//k
         sddg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XvMWrQmE;
       spf=pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=armbru@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by gmr-mx.google.com with ESMTPS id g12si447129iok.4.2019.12.05.03.14.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 03:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of armbru@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-kHGUDLqpNziNq_bbANHhFw-1; Thu, 05 Dec 2019 06:14:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6077C800EC0;
	Thu,  5 Dec 2019 11:14:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-134.ams2.redhat.com [10.36.116.134])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 178215C1C3;
	Thu,  5 Dec 2019 11:14:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9E03A1138606; Thu,  5 Dec 2019 12:14:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  liang yan <lyan@suse.com>,  Jailhouse <jailhouse-dev@googlegroups.com>,  Claudio Fontana <claudio.fontana@gmail.com>,  "Michael S . Tsirkin" <mst@redhat.com>,  Hannes Reinecke <hare@suse.de>,  Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device revision 2
References: <cover.1573477032.git.jan.kiszka@siemens.com>
	<cover.1573477032.git.jan.kiszka@siemens.com>
	<f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
Date: Thu, 05 Dec 2019 12:14:18 +0100
In-Reply-To: <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
	(Jan Kiszka's message of "Mon, 11 Nov 2019 13:57:11 +0100")
Message-ID: <87blsndnxx.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kHGUDLqpNziNq_bbANHhFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: armbru@redhat.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@redhat.com header.s=mimecast20190719 header.b=XvMWrQmE;
       spf=pass (google.com: domain of armbru@redhat.com designates
 207.211.31.120 as permitted sender) smtp.mailfrom=armbru@redhat.com;
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

This has been on the list for more than three weeks already.  I
apologize for the delay.

Jan Kiszka <jan.kiszka@siemens.com> writes:

> From: Jan Kiszka <jan.kiszka@siemens.com>
>
> This imports the ivshmem v2 specification draft from Jailhouse. Its
> final home is to be decided, this shall just simplify the review process
> at this stage.
>
> Note that specifically the Features register (offset 08h) is still under
> consideration. In particular, its bit 0 seems useless now as its benefit
> to guests, specifically when they want to be portable, is close to zero.
> Maybe the register should still be kept, with all bits RsvdZ, for easier
> extensibility.
>
> The rest appears now rather mature and reasonably implementable, as
> proven also by a version for Jailhouse.
>
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  docs/specs/ivshmem-2-device-spec.md | 333 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 333 insertions(+)
>  create mode 100644 docs/specs/ivshmem-2-device-spec.md
>
> diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2-device-spec.md
> new file mode 100644
> index 0000000000..98cfde585a
> --- /dev/null
> +++ b/docs/specs/ivshmem-2-device-spec.md
> @@ -0,0 +1,333 @@
> +IVSHMEM Device Specification
> +============================
> +
> +** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE SPECIFICATION! **
> +
> +The Inter-VM Shared Memory device provides the following features to its users:
> +
> +- Interconnection between up to 65536 peers
> +
> +- Multi-purpose shared memory region
> +
> +    - common read/writable section
> +
> +    - unidirectional sections that are read/writable for one peer and only
> +      readable for the others
> +
> +    - section with peer states
> +
> +- Event signaling via interrupt to remote sides
> +
> +- Support for life-cycle management via state value exchange and interrupt
> +  notification on changes, backed by a shared memory section
> +
> +- Free choice of protocol to be used on top
> +
> +- Protocol type declaration
> +
> +- Unprivileged access to memory-mapped or I/O registers feasible
> +
> +- Discoverable and configurable via standard PCI mechanisms

Stating requirements is much appreciated.  Design rationale would be
even better :)

As pointed out many times, shared memory is not a solution to any
communication problem, it's merely a building block for building such
solutions: you invariably have to layer some protocol on top.  In your
KVM Forum talk, you mention layering virtio on top.  Makes sense to me.
But why does *this* virtio transport have to be an independent device?
Other transports aren't.

Now let me indulge in spec nitpicking :)

> +
> +
> +Hypervisor Model
> +----------------
> +
> +In order to provide a consistent link between peers, all connected instances of
> +IVSHMEM devices need to be configured, created and run by the hypervisor
> +according to the following requirements:
> +
> +- The instances of the device need to be accessible via PCI programming
> +  interfaces on all sides.

What does that mean?

> +
> +- The read/write shared memory section has to be of the same size for all
> +  peers and, if non-zero, has to reflect the same memory content for them.

Isn't "same memory content" redundant with "shared memory"?

> +
> +- If output sections are present (non-zero section size), there must be one
> +  reserved for each peer with exclusive write access. All output sections
> +  must have the same size and must be readable for all peers. They have to
> +  reflect the same memory content for all peers.

Are these the "unidirectional sections" mentioned previously?

> +
> +- The State Table must have the same size for all peers, must be large enough to
> +  hold a state values of all peers, and must be read-only for the user.

"the state values", I guess.

> +
> +- State register changes (explicit writes, peer resets) have to be propagated
> +  to the other peers by updating the corresponding State Table entry and issuing
> +  an interrupt to all other peers if they enabled reception.
> +
> +- Interrupts events triggered by a peer have to be delivered to the target peer,
> +  provided the receiving side is valid and has enabled the reception.
> +
> +- All peers must have the same interrupt delivery features available, i.e. MSI-X
> +  with the same maximum number of vectors on platforms supporting this
> +  mechanism, otherwise INTx with one vector.

Use case for legacy INTx?

For what it's worth, we removed INTx support from ivshmem v1 in rev 1,
QEMU 2.6.

> +
> +
> +Guest-side Programming Model
> +----------------------------
> +
> +An IVSHMEM device appears as a PCI device to its users. Unless otherwise noted,
> +it conforms to the PCI Local Bus Specification, Revision 3.0 As such, it is

Uh, is there anything in it that does *not* conform to this spec?

> +discoverable via the PCI configuration space and provides a number of standard
> +and custom PCI configuration registers.
> +
> +### Shared Memory Region Layout
> +
> +The shared memory region is divided into several sections.
> +
> +    +-----------------------------+   -
> +    |                             |   :
> +    | Output Section for peer n-1 |   : Output Section Size
> +    |     (n = Maximum Peers)     |   :
> +    +-----------------------------+   -
> +    :                             :
> +    :                             :
> +    :                             :
> +    +-----------------------------+   -
> +    |                             |   :
> +    |  Output Section for peer 1  |   : Output Section Size
> +    |                             |   :
> +    +-----------------------------+   -
> +    |                             |   :
> +    |  Output Section for peer 0  |   : Output Section Size
> +    |                             |   :
> +    +-----------------------------+   -
> +    |                             |   :
> +    |     Read/Write Section      |   : R/W Section Size
> +    |                             |   :
> +    +-----------------------------+   -
> +    |                             |   :
> +    |         State Table         |   : State Table Size
> +    |                             |   :
> +    +-----------------------------+   <-- Shared memory base address
> +
> +The first section consists of the mandatory State Table. Its size is defined by
> +the State Table Size register and cannot be zero. This section is read-only for
> +all peers.
> +
> +The second section consists of shared memory that is read/writable for all
> +peers. Its size is defined by the R/W Section Size register. A size of zero is
> +permitted.
> +
> +The third and following sections are unidirectional output sections, one for
> +each peer. Their sizes are all identical. The size of a single output section is
> +defined by the Output Section Size register. An output section is read/writable
> +for the corresponding peer and read-only for all other peers. E.g., only the
> +peer with ID 3 can write to the fourths output section, but all peers can read
> +from this section.
> +
> +All sizes have to be rounded up to multiples of a mappable page in order to
> +allow access control according to the section restrictions.
> +
> +### Configuration Space Registers
> +
> +#### Header Registers
> +
> +| Offset | Register               | Content                                              |
> +|-------:|:-----------------------|:-----------------------------------------------------|
> +|    00h | Vendor ID              | 1AF4h                                                |
> +|    02h | Device ID              | 1110h                                                |

Same as ivshmem v1.  Revision ID (offset 08h) disambiguates.

> +|    04h | Command Register       | 0000h on reset, implementing bits 1, 2, 10           |

What does "implementing bits ..." mean?

> +|    06h | Status Register        | 0010h, static value (bit 3 not implemented)          |

What does "bit 3 not implemented" mean?

> +|    08h | Revision ID            | 02h                                                  |

ivshmem v1 is rev 0 before QEMU 2.6, rev 1 since.  Rev 1 is
backward-compatible to rev 0 for guest software.  Is rev 2 intended to
be backward-compatible, too?

You should probably explan how your v2 relates to v1 in more detail,
possibly in its own top-level section.

> +|    09h | Class Code, Interface  | Protocol Type bits 0-7, see [Protocols](#Protocols)  |
> +|    0Ah | Class Code, Sub-Class  | Protocol Type bits 8-15, see [Protocols](#Protocols) |
> +|    0Bh | Class Code, Base Class | FFh                                                  |

FFh means "device does not fit any defined class."  For what it's worth,
ivshmem v1 uses 05h "Memory Controller", with sub-class and interface
00h "RAM Controller".

> +|    0Eh | Header Type            | 00h                                                  |
> +|    10h | BAR 0                  | MMIO or I/O register region                          |

Use case for I/O?

For what it's worth, ivshmem v1 never supported I/O.

> +|    14h | BAR 1                  | MSI-X region                                         |
> +|    18h | BAR 2 (with BAR 3)     | optional: 64-bit shared memory region                |

What does "(with BAR 3)" mean?

> +|    2Ch | Subsystem Vendor ID    | same as Vendor ID, or provider-specific value        |
> +|    2Eh | Subsystem ID           | same as Device ID, or provider-specific value        |

ivshmem v1 leaves these blank.

> +|    34h | Capability Pointer     | First capability                                     |
> +|    3Eh | Interrupt Pin          | 01h-04h, must be 00h if MSI-X is available           |

"If MSI-X is available"?

A PCIe device always provides MSI-X, and may additionally provide legacy
INTx.  A conventional PCI device may provide either or both.  In any
case, the Interrupt Pin register is zero when legacy INTx is not
provided,

> +
> +If BAR 2 is not present, the shared memory region is not relocatable by the
> +user. In that case, the hypervisor has to implement the Base Address register in
> +the vendor-specific capability.
> +
> +Other header registers may not be implemented. If not implemented, they return 0
> +on read and ignore write accesses.

Is this an example of where the device does not conform to the PCI Local
Bus Specification?

> +
> +#### Vendor Specific Capability (ID 09h)
> +
> +| Offset | Register            | Content                                        |
> +|-------:|:--------------------|:-----------------------------------------------|
> +|    00h | ID                  | 09h                                            |
> +|    01h | Next Capability     | Pointer to next capability or 00h              |
> +|    02h | Length              | 18h or 20h                                     |
> +|    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
> +|        |                     | Bits 1-7: RsvdZ                                |

Please define RsvdZ somewhere, or use plainer language.

> +|    04h | State Table Size    | 32-bit size of read-only State Table           |
> +|    08h | R/W Section Size    | 64-bit size of common read/write section       |
> +|    10h | Output Section Size | 64-bit size of unidirectional output sections  |
> +|    18h | Base Address        | optional: 64-bit base address of shared memory |

Length is 20h when Base Adress is present, else 18h.  Worth spelling
that out?

> +
> +All registers are read-only, except for bit 0 of the Privileged Control
> +register.

Well, the other bits of that register are writable, they're just
ignored.

For what it's worth, existing ivshmem-spec.txt uses the terms read-only,
write-only, read/write and reserved bits rigorously: "Software should
only access the registers as specified [...]  Reserved bits should be
ignored on read, and preserved on write."

> +
> +When bit 0 in the Privileged Control register is set to 1, the device clears
> +bit 0 in the Interrupt Control register on each interrupt delivery. This enables
> +automatic interrupt throttling when re-enabling shall be performed by a
> +scheduled unprivileged instance on the user side.
> +
> +If an IVSHMEM device does not support a relocatable shared memory region, BAR 2
> +must not be implemented by the provider. Instead, the Base Address register has
> +to be implemented to report the location of the shared memory region in the
> +user's address space.

Rationale for not wanting to support relocatable shared memory?

> +
> +A non-existing shared memory section has to report zero in its Section Size
> +register.

This vendor-specific capability must always be present, I presume.
Worth spelling out.

> +
> +#### MSI-X Capability (ID 11h)
> +
> +On platforms supporting MSI-X, IVSHMEM has to provide interrupt delivery via
> +this mechanism. In that case, the legacy INTx delivery mechanism is not
> +available, and the Interrupt Pin configuration register returns 0.

I'm confused.  Does that mean the device shall support either MSI-X or
legacy INTx, but never both?

> +
> +The IVSHMEM device has no notion of pending interrupts. Therefore, reading from
> +the MSI-X Pending Bit Array will always return 0.

I guess this means a polling mode of operation is not possible.
Correct?

> +
> +The corresponding MSI-X MMIO region is configured via BAR 1.
> +
> +The MSI-X table size reported by the MSI-X capability structure is identical for
> +all peers.
> +
> +### Register Region
> +
> +The register region may be implemented as MMIO or I/O.
> +
> +When implementing it as MMIO, the hypervisor has to ensure that the register
> +region can be mapped as a single page into the address space of the user. Write

"can be mapped as a single page" depends on the host system, not the
device.

For what it's worth, ivshmem v1 fixes the size of BAR0 to 256 bytes.
Any particular reason to keep its size so loosely specified in v2?

> +accesses to MMIO region offsets that are not backed by registers have to be
> +ignored, read accesses have to return 0. This enables the user to hand out the
> +complete region, along with the shared memory, to an unprivileged instance.
> +
> +The region location in the user's physical address space is configured via BAR
> +0. The following table visualizes the region layout:
> +
> +| Offset | Register                                                            |
> +|-------:|:--------------------------------------------------------------------|
> +|    00h | ID                                                                  |
> +|    04h | Maximum Peers                                                       |
> +|    08h | Features                                                            |
> +|    0Ch | Interrupt Control                                                   |
> +|    10h | Doorbell                                                            |
> +|    14h | State                                                               |
> +
> +All registers support only aligned 32-bit accesses.

Definitely not backwards compatible to rev 1.  I figure that means v2
should use a different Vendor ID / Device ID, not just bump the Revsion
ID.

No interrupt status register?

> +
> +#### ID Register (Offset 00h)
> +
> +Read-only register that reports the ID of the local device. It is unique for all
> +of the connected devices and remains unchanged over their lifetime.
> +
> +#### Maximum Peers Register (Offset 04h)
> +
> +Read-only register that reports the maximum number of possible peers (including
> +the local one). The supported range is between 2 and 65536 and remains constant
> +over the lifetime of all peers.

Value 1 would be boring, but is it really impossible?

> +
> +#### Features Register (Offset 08h)
> +
> +Read-only register that reports features of the local device or the connected
> +peers. Its content remains constant over the lifetime of all peers.
> +
> +| Bits | Content                                                               |
> +|-----:|:----------------------------------------------------------------------|
> +|    0 | 1: Synchronized shared memory base address                            |
> +| 1-31 | RsvdZ                                                                 |
> +
> +If "synchronized shared memory base address" is reported (bit 0 is set), the
> +shared memory region is mapped at the same address into the user address spaces
> +of all connected peers. Thus, peers can use physical addresses as pointers when
> +exchanging information via the shared memory. This feature flag is never set
> +when the shared memory region is relocatable via BAR 2.
> +
> +#### Interrupt Control Register (Offset 0Ch)
> +
> +This read/write register controls the generation of interrupts whenever a peer
> +writes to the Doorbell register or changes its state.
> +
> +| Bits | Content                                                               |
> +|-----:|:----------------------------------------------------------------------|
> +|    0 | 1: Enable interrupt generation                                        |
> +| 1-31 | RsvdZ                                                                 |
> +
> +Note that bit 0 is reset to 0 on interrupt delivery if one-shot interrupt mode
> +is enabled in the Enhanced Features register.
> +
> +The value of this register after device reset is 0.

I presume this applies only to legacy INTx.  Correct?

ivshmem v1 calls this Interrupt Mask.

> +
> +#### Doorbell Register (Offset 10h)
> +
> +Write-only register that triggers an interrupt vector in the target device if it
> +is enabled there.
> +
> +| Bits  | Content                                                              |
> +|------:|:---------------------------------------------------------------------|
> +|  0-15 | Vector number                                                        |
> +| 16-31 | Target ID                                                            |
> +
> +Writing a vector number that is not enabled by the target has no effect. The
> +peers can derive the number of available vectors from their own device
> +capabilities and are expected to define or negotiate the used ones via the
> +selected protocol.

That's because all peers use the same number of vectors.  Worth spelling out?

> +
> +Addressing a non-existing or inactive target has no effect. Peers can identify
> +active targets via the State Table.
> +
> +The behavior on reading from this register is undefined.
> +
> +#### State Register (Offset 14h)
> +
> +Read/write register that defines the state of the local device. Writing to this
> +register sets the state and triggers interrupt vector 0 on the remote device if

"the remote device"?  Do you mean all peers?

"interrupt vector 0" assumes MSI-X.  With legacy INTx, it simply
triggers an interrupt.

How can guest software distinguish between "interrupt due to remote
state change" and "interrupt due to doorbell"?

Things become so much easier when you ditch INTx: reserve vector 0 for
state change, done.

> +the written state value differs from the previous one. The user of the remote
> +device can read the value written to this register from the State Table.
> +
> +The value of this register after device reset is 0.

I guess the meaning of state values depends on the protocol type.
Correct?

> +
> +### State Table
> +
> +The State Table is a read-only section at the beginning of the shared memory
> +region. It contains a 32-bit state value for each of the peers. Locating the
> +table in shared memory allows fast checking of remote states without register
> +accesses.
> +
> +The table is updated on each state change of a peers. Whenever a user of an
> +IVSHMEM device writes a value to the Local State register, this value is copied
> +into the corresponding entry of the State Table. When a IVSHMEM device is reset
> +or disconnected from the other peers, zero is written into the corresponding
> +table entry. The initial content of the table is all zeros.
> +
> +    +--------------------------------+
> +    | 32-bit state value of peer n-1 |
> +    +--------------------------------+
> +    :                                :
> +    +--------------------------------+
> +    | 32-bit state value of peer 1   |
> +    +--------------------------------+
> +    | 32-bit state value of peer 0   |
> +    +--------------------------------+ <-- Shared memory base address
> +
> +
> +Protocols
> +---------
> +
> +The IVSHMEM device shall support the peers of a connection in agreeing on the
> +protocol used over the shared memory devices. For that purpose, the interface
> +byte (offset 09h) and the sub-class byte (offset 0Ah) of the Class Code register
> +encodes a 16-bit protocol type for the users. The following type values are
> +defined:
> +
> +| Protocol Type | Description                                                  |
> +|--------------:|:-------------------------------------------------------------|
> +|         0000h | Undefined type                                               |
> +|         0001h | Virtual peer-to-peer Ethernet                                |
> +|   0002h-3FFFh | Reserved                                                     |
> +|   4000h-7FFFh | User-defined protocols                                       |
> +|   8000h-BFFFh | Virtio over Shared Memory, front-end peer                    |
> +|   C000h-FFFFh | Virtio over Shared Memory, back-end peer                     |
> +
> +Details of the protocols are not in the scope of this specification.

Are you sure this use of PCI class code is kosher?

Final request: please break your lines around column 70 for readability.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/87blsndnxx.fsf%40dusky.pond.sub.org.
