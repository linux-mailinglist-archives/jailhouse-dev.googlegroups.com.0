Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJ7VVX3AKGQESMGVNUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 182841E084D
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 May 2020 09:58:32 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id c3sf2639736edj.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 May 2020 00:58:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590393511; cv=pass;
        d=google.com; s=arc-20160816;
        b=AM7xiN4FIrbsXN66f11qOaEcBS8cO7sA4QfNAoaUg9oZVnah62KrVqDComymWttLSM
         oHjPBosCbapT725GAtd+08m5+ayJaEXJfILK0c5wS9uaTHyCvH+8c3w5I3gHYQ/rlI6S
         i4Zc/yEw90TqIEMAG5d31NQ4c+pNmGFW9+wSuITANmFa1MZDY5aDnGY9WYC1WIiQQGXk
         3SETAkgi4o9xxt+ZRXAFjtyLN2CNwTmKBX9AgFEB2k/7gGKvagUBwKyln3rF10LU5QwJ
         WB6NrGQlhxok5cTnhlHgkoABueN/7qKkLXBWcnHa7Sm6j3Mnx60pLf9AU/QZfFey/PDz
         d+MQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=r0Ls4J5DdWMFygaE/ESgByN3fDhxcBmaMmt4l3KGC/U=;
        b=L1LXXPABSgJC79MTy1mNsYHZqIRwHIeXY6fcXkc9s3cPU41OXrEt41R8fCuC0vp5Zn
         /a0/Ko1Yr+yqHCKRMjWyjhA05aIls6d8uyoYNlc1Ypsj41wgPt6zek3uOlBiSHg1JC24
         DV7iYUH5y8zU0JKkDkIAX4YjgD54LZXO8CFe7E8//VV93RbZBvzcb0SQlsCG3SegPnzD
         koj+/0oab/NiiQWN/RBLxY6dxouSMkGqS0Lsy5Sy9xyKsNiulK8XLaLUe9s0l+vpmmIf
         S/TG32BHq5unDamFuCN6w44vPrzSZRqSQfANQPevRc3NHTTL591Pk101XyXCa9r4rZTV
         wCog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r0Ls4J5DdWMFygaE/ESgByN3fDhxcBmaMmt4l3KGC/U=;
        b=UdkYC9EbYUqiXB4RfeNyWJoQZLoEWF8DV/pQjjYi8Dtoitb/+jKF0XMed0MThrlQ5G
         2ZBx8KxU1l+fa/NnymbRR3vre3ofEn5qLv0fv5LpC9j3DJtf7vXAhVXs7o27mYwgI5XR
         trNfjSKflo9Iz/91+GFMzasjtwUyOQqegk9Ro9kCKYGSHmaSfGGf4aKTIXPiZ4vLSLuq
         LHVPVRuxOm/1jlBHBrHAw4QqtoS7mYo2Puw4TyJm+hlpKk/1srd3IPweCihtMOT9Eal1
         IfExSIoJsimX6RSETs+h321biIR7dAr0O3YZxMV9IFcoe0f0mAejck97aTZA2Gwt+sh4
         VwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r0Ls4J5DdWMFygaE/ESgByN3fDhxcBmaMmt4l3KGC/U=;
        b=rAdKNT6Z0cskd60dk7fdRatuOKR+F59bioE5rYReADbAD/h593+6PIm3qPZhoFiLVF
         HONINsE1Aeo/2tIahnLn+UKu4eUxUFv5M8pVlQDh9tSiGx04q8FEvpJHoxGzdNsN/ojS
         7VmJ9CxLbZwHtNFGv+b3UTb6KCMmmKWSZzW31nJ4gf+c6sCr08hzZ2aZ4r+O1D+GAIdH
         E5o1vB1xtiHhDdbFKiH2sKsCu6ByMaDqe7QdTgfvpXdaS/0CN9V38ivukRcBkFTMbnLe
         +iKyB2T63Z45rPMFLoBJLTcKFl76MLtefvggSn1+VGtY7Q7+mstQYmzKRj9fGCy1GrXX
         9Tbw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JQfAOz09Zuyr3fUun6KG8LRl7CB5iZzGFu7WNclW/C8igOVGv
	epTqqQa+Gjev3SoKO+eKBko=
X-Google-Smtp-Source: ABdhPJwnwmeeGBnxQ5QSk+u8m7/skakUbexeadgiEvUNmcLLzr56DWEtSp7U99ePRXoIIOe/pq42lw==
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr17607416ejb.446.1590393511711;
        Mon, 25 May 2020 00:58:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:48c2:: with SMTP id d2ls3524358ejt.11.gmail; Mon, 25
 May 2020 00:58:30 -0700 (PDT)
X-Received: by 2002:a17:906:2b96:: with SMTP id m22mr18568545ejg.330.1590393510930;
        Mon, 25 May 2020 00:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590393510; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKipK4y1nes0w9HA2FsrQSgs52NDZ0oyGkg2owBVGwyFNQD4C10xHm0sn6Wvv3SKok
         w944Z8bAt9WX7inhUt/KqbNw+aNis7T1sVjPmoeGsIHrHxx/JwPL5++3l42iY9kVnHwV
         AA2sBtGDuhUxbP8dXxfSpbvw2gJJwF/2fjI5uyo6QQO7aQZA8swpCeuOo05OiEoGcsoD
         /cEs58L1LARhYMRkeBc9KP81wuoSB2cQmMo4g5lbNY68ii4NqrhsiZNyq/J3mOt1vxB1
         hh0YPEs2psCPwzfEh3PeiP/35Ff18DTid4uORw1gIqHyk/WNGKrUlXyd9IjlHK60snyX
         ly8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to;
        bh=nvXj8r1ibeVuDjqbrKhMSJ3xoxJc+h9vd8sJBHOqT2E=;
        b=r9WobR1x/vn+Dtm2QxezyNnJvMSfyFeWM1l66OfHpKf1h4Q6pEiy9oz73LZ+hzavMc
         WcHwpB7TIWV3oHy9tb/wHl53HzYeB2Tb2MUl11jyNqn2J8fDwDpEbxoxhfF4TGRM2KEm
         QnC9zh3hy0AZXsp3sRXAXMB65cJwiTCofu6PhSqMHznEkpQHXfXXErRdIyduDEQhwQ2r
         AaJHRIil91spqza2oCDJIY5Cw6f2Z5R8n2oXS94jjchAQvYhOTECYTMF6j8cQYVLWx7j
         0R46LByckFuRAmhzBeti7MBWdH4QFukT4NkkZgJrUj2zAlETQd55sfwEcCkqvfLcjGyK
         gnnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a17si285257edx.1.2020.05.25.00.58.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 May 2020 00:58:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 04P7wUCx004856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 May 2020 09:58:30 +0200
Received: from [167.87.48.3] ([167.87.48.3])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04P7wSTc012883;
	Mon, 25 May 2020 09:58:28 +0200
To: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        liang yan <lyan@suse.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [RFC] ivshmem v2: Shared memory device specification
Message-ID: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
Date: Mon, 25 May 2020 09:58:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
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

Hi all,

as requested by Michael, find below the current version of the Inter-VM 
Shared Memory device specification version 2 (as version 1 could be 
considered what is currently in QEMU).

This posting is intended to collect feedback from the virtio community 
before officially proposing it to become part of the spec. As you can 
see, the spec format is not yet integrated with the virtio documents at 
all.

IVSHMEM has value of its own, allowing unprivileged applications to 
establish links to other applications in VMs connected via this 
transport. In addition, and that is where virtio comes into play even 
more, it can be used to build virtio backend-frontend connections 
between two VMs. Prototypes have been developed, see e.g. [1], 
specifying that transport is still a to-do. I will try to reserve a few 
cycle in the upcoming weeks for a first draft.

My current strategy for these two pieces, ivshmem2 and virtio-shmem, is 
propose them both to virtio but allowing virtio-shmem to also be mapped 
on other shared memory channels for virtual machines.

The ivshmem2 device model is fairly stable now, also being in use in 
Jailhouse for quite a while. Still there are some aspects that could be 
worth to discuss in particular:

 - Do we also need a platform device model, in addition to PCI? My
   feelings are negative, but there has been at least one request.

 - Should we add some feature flags, or is using the PCI revision ID
   sufficient (...to do that later)? Currently, there is no need for
   communicating features this way.

 - Should we try to model the doorbell interface more flexibly, in way
   that may allow mapping it on hardware-provided mailboxes (i.e. VM-
   exit free channels)? Unfortunately, I'm not yet aware of any hardware
   that could provide this feature and, thus, could act as a use case to
   design against.

Thanks,
Jan

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg668749.html

---

IVSHMEM Device Specification
============================

** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE SPECIFICATION! **

The goal of the Inter-VM Shared Memory (IVSHMEM) device model is to
define the minimally needed building blocks a hypervisor has to
provide for enabling guest-to-guest communication. The details of
communication protocols shall remain opaque to the hypervisor so that
guests are free to define them as simple or sophisticated as they
need.

For that purpose, the IVSHMEM provides the following features to its
users:

- Interconnection between up to 65536 peers

- Multi-purpose shared memory region

    - common read/writable section

    - output sections that are read/writable for one peer and only
      readable for the others

    - section with peer states

- Event signaling via interrupt to remote sides

- Support for life-cycle management via state value exchange and
  interrupt notification on changes, backed by a shared memory
  section

- Free choice of protocol to be used on top

- Protocol type declaration

- Register can be implemented either memory-mapped or via I/O,
  depending on platform support and lower VM-exit costs

- Unprivileged access to memory-mapped or I/O registers feasible

- Single discovery and configuration via standard PCI, no complexity
  by additionally defining a platform device model


Hypervisor Model
----------------

In order to provide a consistent link between peers, all connected
instances of IVSHMEM devices need to be configured, created and run
by the hypervisor according to the following requirements:

- The instances of the device shall appear as a PCI device to their
  users.

- The read/write shared memory section has to be of the same size for
  all peers. The size can be zero.

- If shared memory output sections are present (non-zero section
  size), there must be one reserved for each peer with exclusive
  write access. All output sections must have the same size and must
  be readable for all peers.

- The State Table must have the same size for all peers, must be
  large enough to hold the state values of all peers, and must be
  read-only for the user.

- State register changes (explicit writes, peer resets) have to be
  propagated to the other peers by updating the corresponding State
  Table entry and issuing an interrupt to all other peers if they
  enabled reception.

- Interrupts events triggered by a peer have to be delivered to the
  target peer, provided the receiving side is valid and has enabled
  the reception.

- All peers must have the same interrupt delivery features available,
  i.e. MSI-X with the same maximum number of vectors on platforms
  supporting this mechanism, otherwise INTx with one vector.


Guest-side Programming Model
----------------------------

An IVSHMEM device appears as a PCI device to its users. Unless
otherwise noted, it conforms to the PCI Local Bus Specification,
Revision 3.0. As such, it is discoverable via the PCI configuration
space and provides a number of standard and custom PCI configuration
registers.

### Shared Memory Region Layout

The shared memory region is divided into several sections.

    +-----------------------------+   -
    |                             |   :
    | Output Section for peer n-1 |   : Output Section Size
    |     (n = Maximum Peers)     |   :
    +-----------------------------+   -
    :                             :
    :                             :
    :                             :
    +-----------------------------+   -
    |                             |   :
    |  Output Section for peer 1  |   : Output Section Size
    |                             |   :
    +-----------------------------+   -
    |                             |   :
    |  Output Section for peer 0  |   : Output Section Size
    |                             |   :
    +-----------------------------+   -
    |                             |   :
    |     Read/Write Section      |   : R/W Section Size
    |                             |   :
    +-----------------------------+   -
    |                             |   :
    |         State Table         |   : State Table Size
    |                             |   :
    +-----------------------------+   <-- Shared memory base address

The first section consists of the mandatory State Table. Its size is
defined by the State Table Size register and cannot be zero. This
section is read-only for all peers.

The second section consists of shared memory that is read/writable
for all peers. Its size is defined by the R/W Section Size register.
A size of zero is permitted.

The third and following sections are output sections, one for each
peer. Their sizes are all identical. The size of a single output
section is defined by the Output Section Size register. An output
section is read/writable for the corresponding peer and read-only for
all other peers. E.g., only the peer with ID 3 can write to the
fourths output section, but all peers can read from this section.

All sizes have to be rounded up to multiples of a mappable page in
order to allow access control according to the section restrictions.

### Configuration Space Registers

#### Header Registers

| Offset | Register               | Content                                              |
|-------:|:-----------------------|:-----------------------------------------------------|
|    00h | Vendor ID              | 110Ah                                                |
|    02h | Device ID              | 4106h                                                |
|    04h | Command Register       | 0000h on reset, writable bits are:                   |
|        |                        | Bit 0: I/O Space (if Register Region uses I/O)       |
|        |                        | Bit 1: Memory Space (if Register Region uses Memory) |
|        |                        | Bit 3: Bus Master                                    |
|        |                        | Bit 10: INTx interrupt disable                       |
|        |                        | Writes to other bits are ignored                     |
|    06h | Status Register        | 0010h, static value                                  |
|        |                        | In deviation to the PCI specification, the Interrupt |
|        |                        | Status (bit 3) is never set                          |
|    08h | Revision ID            | 00h                                                  |
|    09h | Class Code, Interface  | Protocol Type bits 0-7, see [Protocols](#Protocols)  |
|    0Ah | Class Code, Sub-Class  | Protocol Type bits 8-15, see [Protocols](#Protocols) |
|    0Bh | Class Code, Base Class | FFh                                                  |
|    0Eh | Header Type            | 00h                                                  |
|    10h | BAR 0                  | MMIO or I/O register region                          |
|    14h | BAR 1                  | MSI-X region                                         |
|    18h | BAR 2 (with BAR 3)     | optional: 64-bit shared memory region                |
|    2Ch | Subsystem Vendor ID    | same as Vendor ID, or provider-specific value        |
|    2Eh | Subsystem ID           | same as Device ID, or provider-specific value        |
|    34h | Capability Pointer     | First capability                                     |
|    3Eh | Interrupt Pin          | 01h-04h, must be 00h if MSI-X is available           |

The INTx status bit is never set by an implementation. Users of the
IVSHMEM device are instead expected to derive the event state from
protocol-specific information kept in the shared memory. This
approach is significantly faster, and the complexity of
register-based status tracking can be avoided.

If BAR 2 is not present, the shared memory region is not relocatable
by the user. In that case, the hypervisor has to implement the Base
Address register in the vendor-specific capability.

Subsystem IDs shall encode the provider (hypervisor) in order to
allow identifying potential deviating implementations in case this
should ever be required.

If its platform supports MSI-X, an implementation of the IVSHMEM
device must provide this interrupt model and must not expose INTx
support.

Other header registers may not be implemented. If not implemented,
they return 0 on read and ignore write accesses.

#### Vendor Specific Capability (ID 09h)

This capability must always be present.

| Offset | Register            | Content                                        |
|-------:|:--------------------|:-----------------------------------------------|
|    00h | ID                  | 09h                                            |
|    01h | Next Capability     | Pointer to next capability or 00h              |
|    02h | Length              | 20h if Base Address is present, 18h otherwise  |
|    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
|        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
|    04h | State Table Size    | 32-bit size of read-only State Table           |
|    08h | R/W Section Size    | 64-bit size of common read/write section       |
|    10h | Output Section Size | 64-bit size of output sections                 |
|    18h | Base Address        | optional: 64-bit base address of shared memory |

All registers are read-only. Writes are ignored, except to bit 0 of
the Privileged Control register.

When bit 0 in the Privileged Control register is set to 1, the device
clears bit 0 in the Interrupt Control register on each interrupt
delivery. This enables automatic interrupt throttling when
re-enabling shall be performed by a scheduled unprivileged instance
on the user side.

An IVSHMEM device may not support a relocatable shared memory region.
This support the hypervisor in locking down the guest-to-host address
mapping and simplifies the runtime logic. In such a case, BAR 2 must
not be implemented by the hypervisor. Instead, the Base Address
register has to be implemented to report the location of the shared
memory region in the user's address space.

A non-existing shared memory section has to report zero in its
Section Size register.

#### MSI-X Capability (ID 11h)

On platforms supporting MSI-X, IVSHMEM has to provide interrupt
delivery via this mechanism. In that case, the MSI-X capability is
present while the legacy INTx delivery mechanism is not available,
and the Interrupt Pin configuration register returns 0.

The IVSHMEM device has no notion of pending interrupts. Therefore,
reading from the MSI-X Pending Bit Array will always return 0. Users
of the IVSHMEM device are instead expected to derive the event state
from protocol-specific information kept in the shared memory. This
approach is significantly faster, and the complexity of
register-based status tracking can be avoided.

The corresponding MSI-X MMIO region is configured via BAR 1.

The MSI-X table size reported by the MSI-X capability structure is
identical for all peers.

### Register Region

The register region may be implemented as MMIO or I/O.

When implementing it as MMIO, the hypervisor has to ensure that the
register region can be mapped as a single page into the address space
of the user, without causing potential overlaps with other resources.
Write accesses to MMIO region offsets that are not backed by
registers have to be ignored, read accesses have to return 0. This
enables the user to hand out the complete region, along with the
shared memory, to an unprivileged instance.

The region location in the user's physical address space is
configured via BAR 0. The following table visualizes the region
layout:

| Offset | Register                                                            |
|-------:|:--------------------------------------------------------------------|
|    00h | ID                                                                  |
|    04h | Maximum Peers                                                       |
|    08h | Interrupt Control                                                   |
|    0Ch | Doorbell                                                            |
|    10h | State                                                               |

All registers support only aligned 32-bit accesses.

#### ID Register (Offset 00h)

Read-only register that reports the ID of the local device. It is
unique for all of the connected devices and remains unchanged over
their lifetime.

#### Maximum Peers Register (Offset 04h)

Read-only register that reports the maximum number of possible peers
(including the local one). The permitted range is between 2 and 65536
and remains constant over the lifetime of all peers.

#### Interrupt Control Register (Offset 08h)

This read/write register controls the generation of interrupts
whenever a peer writes to the Doorbell register or changes its state.

| Bits | Content                                                               |
|-----:|:----------------------------------------------------------------------|
|    0 | 1: Enable interrupt generation                                        |
| 1-31 | Reserved (0 on read, writes ignored)                                  |

Note that bit 0 is reset to 0 on interrupt delivery if one-shot
interrupt mode is enabled in the Enhanced Features register.

The value of this register after device reset is 0.

#### Doorbell Register (Offset 0Ch)

Write-only register that triggers an interrupt vector in the target
device if it is enabled there.

| Bits  | Content                                                              |
|------:|:---------------------------------------------------------------------|
|  0-15 | Vector number                                                        |
| 16-31 | Target ID                                                            |

Writing a vector number that is not enabled by the target has no
effect. The peers can derive the number of available vectors from
their own device capabilities because the provider is required to
expose an identical number of vectors to all connected peers. The
peers are expected to define or negotiate the used ones via the
selected protocol.

Addressing a non-existing or inactive target has no effect. Peers can
identify active targets via the State Table.

Implementations of the Doorbell register must ensure that data written by the
CPU prior to issuing the register write is visible to the receiving peer before
the interrupt arrives.

The behavior on reading from this register is undefined.

#### State Register (Offset 10h)

Read/write register that defines the state of the local device.
Writing to this register sets the state and triggers MSI-X vector 0
or the INTx interrupt, respectively, on the remote device if the
written state value differs from the previous one. Users of peer
devices can read the value written to this register from the State
Table. They are expected differentiate state change interrupts from
doorbell events by comparing the new state value with a locally
stored copy.

The value of this register after device reset is 0. The semantic of
all other values can be defined freely by the chosen protocol.

### State Table

The State Table is a read-only section at the beginning of the shared
memory region. It contains a 32-bit state value for each of the
peers. Locating the table in shared memory allows fast checking of
remote states without register accesses.

The table is updated on each state change of a peers. Whenever a user
of an IVSHMEM device writes a value to the Local State register, this
value is copied into the corresponding entry of the State Table. When
a IVSHMEM device is reset or disconnected from the other peers, zero
is written into the corresponding table entry. The initial content of
the table is all zeros.

    +--------------------------------+
    | 32-bit state value of peer n-1 |
    +--------------------------------+
    :                                :
    +--------------------------------+
    | 32-bit state value of peer 1   |
    +--------------------------------+
    | 32-bit state value of peer 0   |
    +--------------------------------+ <-- Shared memory base address


Protocols
---------

The IVSHMEM device shall support the peers of a connection in
agreeing on the protocol used over the shared memory devices. For
that purpose, the interface byte (offset 09h) and the sub-class byte
(offset 0Ah) of the Class Code register encodes a 16-bit protocol
type for the users. The following type values are defined:

| Protocol Type | Description                                                  |
|--------------:|:-------------------------------------------------------------|
|         0000h | Undefined type                                               |
|         0001h | Virtual peer-to-peer Ethernet                                |
|   0002h-3FFFh | Reserved                                                     |
|   4000h-7FFFh | User-defined protocols                                       |
|   8000h-BFFFh | Virtio over Shared Memory, front-end peer                    |
|   C000h-FFFFh | Virtio over Shared Memory, back-end peer                     |

Details of the protocols are not in the scope of this specification.

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f109fe5a-92eb-e5a5-bb83-ada42b3a9b61%40siemens.com.
