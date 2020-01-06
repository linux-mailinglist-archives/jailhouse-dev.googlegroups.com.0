Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WLZTYAKGQEFBAVYOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5086113120A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:07 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id v24sf6162039edb.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313207; cv=pass;
        d=google.com; s=arc-20160816;
        b=zkfXb/PlLc/XxEfbToOxpkaiZWabddB4zGZzup6DvmaoJcqbvs01Bd03L5crQbcVCi
         /QZHUR6tIa2k5ILUePdNEFp0jRJpbbQXCHhsy4IGkILO4KbaqUnQvenh3g/xfQFLLfCD
         lWF49KB1dsQuy/KvS4oHEBUgNYOEt4Cyuf5SfMJta8lND9ZZI94xpfWlRlWiCBp2+Imv
         YK0ufGyblvFqd+pSiKab8PaeueVTdJCkyguCX/Ya2XU0widSaWIeJJKztVNaqnevzUki
         1S1ToJTyxZLESQeL08aSyRym7+7zkF93y4APmpKmhEWWrBWqek+BpHy0yjKdzYW4O0Ac
         2hKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=/2wUjOMtWgYI4SQbb5xuRI3hfNo+nWKCQ2eemYQ3OjQ=;
        b=t9gRjZ3NhLkfwzvpuwChXx50oTCqadUyDC/BJ3iSuQhfBGlQ3YvW9NE10tjItEYbER
         mrmYewOt3oE6I2t+6YI4Qki+jl/WbQk0C5xRCMEveBdsxTuC6xy3Qf8tOWGWYz5gigYL
         BjaEzRAwTuPN1vcWSe7PiRE6JT2rE1LJLe/3XuKam8aMMx21DH1Rr/NSpMt8H19NZp8C
         Z5+7TErh/j7RXUJVnsT5Es9Vxnf4Tr8kYUAds1mvTiJLLaZVil0wSa7zaa+LzbrI23t7
         yGUCohUinJlagFSnhUKhsuPTgpeyuqz6zhGyfg/AyU4v3cmORUNadrVZEixhFns5CByz
         8KQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/2wUjOMtWgYI4SQbb5xuRI3hfNo+nWKCQ2eemYQ3OjQ=;
        b=DFj4OXqAEqSkZtLB2d6SvInfdILWPvaS4s90t5nBrrD0Thvm1MTcholUhCEP102ibe
         kyuKo/YbnZMu++qTi0S0D07oc3Bkk6eClNPvDqKpZ7qX5UKw0RoWfcOKXTmUcb2qIqrk
         qJvnUbPHKw8RZknDW4uZ9QYKOOm41PG3etdthFLfDI/yzbk6St5Uyv103EwyqDS/wdgT
         3CZZqBaUxF8MxZCbcjW90c2HN4SWt54RcSF516y7zf6ELHRmZyQdsHmahzKdcNplUGFs
         a8ajzp2MrVsI8NurGrBbtEEKpo1M7e6EHTlH2ZMQG+iO5m01PymvZUctk32csgXdFWhh
         A0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/2wUjOMtWgYI4SQbb5xuRI3hfNo+nWKCQ2eemYQ3OjQ=;
        b=HXDVbdgJ3nqyXjYCWzfLcc2H1eGReepDgr0Biu0hlhT157XnAWHod/SF0Vj4zEtK78
         SqdxFB4+1lUBLm3YKZj7iRXV/HcnhhkaNZyBqdVr3udMeKjRGyTGe67yM0oJhh3dw0P1
         03GYbZH2kNhKURakUQIrlmPCnjQuRnHAJN81fk4HvglzHt6peiRl8Rt/SWPuHh4mOkzp
         v/MjlT0N3dut26928+nBYT5ACT7ZVXP07tLDZKAZCR9NcPGTtWDm/PubJaTdbFi5H9iD
         jlPkzzLrC0gD0ysrOdUJ8jda1jHAKc1AoCMyY+KCyyrLHxCSCLzRWMLvcm5VliS9d6PW
         nAKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUMgIgGtE+YnCBb8a779uupc2iqeTTDDQlzf25eYNuY7Q+tXh3S
	POrB/G/a3v7ufFG863EoWh0=
X-Google-Smtp-Source: APXvYqw15c2/+orLHGYdwK+40haEwBONaFaNI2A1KS7X2iZM7kck2OCT+ePRWY0233GAJi9sXIeZQw==
X-Received: by 2002:a17:906:29cb:: with SMTP id y11mr106293909eje.67.1578313206746;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:9250:: with SMTP id c16ls15468759ejx.13.gmail; Mon,
 06 Jan 2020 04:20:06 -0800 (PST)
X-Received: by 2002:a17:906:3519:: with SMTP id r25mr111345299eja.47.1578313205976;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=inq5v0mnauO+GYtmfKhiPQ2IX+NCXMMS+zUEpQoy42vhITaXX7QCLu78amRlr280DY
         3L3Qlh5cxi4O9bHl+mcJpVuDFlEGdgIFfxnoWHPZG57Ude7jKjTQOBPhwOM9YZpeIPhd
         MyytmapxZg3XDtCkPmvVN9FwTeGaJ6f8pTGxPQuS2mP1MqVucaNqt2GnsCvkdkTAboWe
         K84PyJFr+ttYd1B7/F7NFlWmPS+AtpetKD/TiLkSpARna+DekRGqM1UlWbCVXwEJODa1
         vk4txjJ/A3+J+WWMkXLZMgvImtKf77Y5OIUMvekurMh2iDu7tkVrk0oJzlLCuMufoWz/
         ZKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=yfE69IHH7mbcObLypmuOlns14gAnXDCj440NT/e1QlY=;
        b=H6ByagmL3n8OKYlcr0yI/BCniIzCYDqmkUBKyZ69yFfShipQO9L4NDDLxLt1UocFCb
         f1hw+iitwGKABKFvnPJavKChl6yPNQjL9/NhaR1uV9Hgvs+Snp2TF5jKAhgFqy7cOldR
         t3W1DVJaTJ1hUardRl7u/y2g80gtV2go2kwYsKIsM5laf2QwWAsujjpIZfwdByTbFTgy
         Y+lu0BuCYMaRQXp6ONGSYltBn3L63dUkkjey6Co47FPEQOXwa23q6XVnlK80NQd0eJMo
         PhT0K6jGquM9W780K1VZIArqvFW/6qtpmfzUinLyihk4BnIHiXe4VWJv/uBxHDZNIx+0
         VO/g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x18si2237418eds.2.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CK5tP020940
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:05 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKFB029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:05 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 37/38] Documentation: Add specification of IVSHMEM v2 device
Date: Mon,  6 Jan 2020 13:18:18 +0100
Message-Id: <60ece6d5722c072bd38a1a6666d03cd2a9327fe5.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 Documentation/ivshmem-v2-specification.md | 376 ++++++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)
 create mode 100644 Documentation/ivshmem-v2-specification.md

diff --git a/Documentation/ivshmem-v2-specification.md b/Documentation/ivshmem-v2-specification.md
new file mode 100644
index 00000000..d93cb22b
--- /dev/null
+++ b/Documentation/ivshmem-v2-specification.md
@@ -0,0 +1,376 @@
+IVSHMEM Device Specification
+============================
+
+** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE SPECIFICATION! **
+
+The goal of the Inter-VM Shared Memory (IVSHMEM) device model is to
+define the minimally needed building blocks a hypervisor has to
+provide for enabling guest-to-guest communication. The details of
+communication protocols shall remain opaque to the hypervisor so that
+guests are free to define them as simple or sophisticated as they
+need.
+
+For that purpose, the IVSHMEM provides the following features to its
+users:
+
+- Interconnection between up to 65536 peers
+
+- Multi-purpose shared memory region
+
+    - common read/writable section
+
+    - output sections that are read/writable for one peer and only
+      readable for the others
+
+    - section with peer states
+
+- Event signaling via interrupt to remote sides
+
+- Support for life-cycle management via state value exchange and
+  interrupt notification on changes, backed by a shared memory
+  section
+
+- Free choice of protocol to be used on top
+
+- Protocol type declaration
+
+- Register can be implemented either memory-mapped or via I/O,
+  depending on platform support and lower VM-exit costs
+
+- Unprivileged access to memory-mapped or I/O registers feasible
+
+- Single discovery and configuration via standard PCI, no complexity
+  by additionally defining a platform device model
+
+
+Hypervisor Model
+----------------
+
+In order to provide a consistent link between peers, all connected
+instances of IVSHMEM devices need to be configured, created and run
+by the hypervisor according to the following requirements:
+
+- The instances of the device shall appear as a PCI device to their
+  users.
+
+- The read/write shared memory section has to be of the same size for
+  all peers. The size can be zero.
+
+- If shared memory output sections are present (non-zero section
+  size), there must be one reserved for each peer with exclusive
+  write access. All output sections must have the same size and must
+  be readable for all peers.
+
+- The State Table must have the same size for all peers, must be
+  large enough to hold the state values of all peers, and must be
+  read-only for the user.
+
+- State register changes (explicit writes, peer resets) have to be
+  propagated to the other peers by updating the corresponding State
+  Table entry and issuing an interrupt to all other peers if they
+  enabled reception.
+
+- Interrupts events triggered by a peer have to be delivered to the
+  target peer, provided the receiving side is valid and has enabled
+  the reception.
+
+- All peers must have the same interrupt delivery features available,
+  i.e. MSI-X with the same maximum number of vectors on platforms
+  supporting this mechanism, otherwise INTx with one vector.
+
+
+Guest-side Programming Model
+----------------------------
+
+An IVSHMEM device appears as a PCI device to its users. Unless
+otherwise noted, it conforms to the PCI Local Bus Specification,
+Revision 3.0. As such, it is discoverable via the PCI configuration
+space and provides a number of standard and custom PCI configuration
+registers.
+
+### Shared Memory Region Layout
+
+The shared memory region is divided into several sections.
+
+    +-----------------------------+   -
+    |                             |   :
+    | Output Section for peer n-1 |   : Output Section Size
+    |     (n = Maximum Peers)     |   :
+    +-----------------------------+   -
+    :                             :
+    :                             :
+    :                             :
+    +-----------------------------+   -
+    |                             |   :
+    |  Output Section for peer 1  |   : Output Section Size
+    |                             |   :
+    +-----------------------------+   -
+    |                             |   :
+    |  Output Section for peer 0  |   : Output Section Size
+    |                             |   :
+    +-----------------------------+   -
+    |                             |   :
+    |     Read/Write Section      |   : R/W Section Size
+    |                             |   :
+    +-----------------------------+   -
+    |                             |   :
+    |         State Table         |   : State Table Size
+    |                             |   :
+    +-----------------------------+   <-- Shared memory base address
+
+The first section consists of the mandatory State Table. Its size is
+defined by the State Table Size register and cannot be zero. This
+section is read-only for all peers.
+
+The second section consists of shared memory that is read/writable
+for all peers. Its size is defined by the R/W Section Size register.
+A size of zero is permitted.
+
+The third and following sections are output sections, one for each
+peer. Their sizes are all identical. The size of a single output
+section is defined by the Output Section Size register. An output
+section is read/writable for the corresponding peer and read-only for
+all other peers. E.g., only the peer with ID 3 can write to the
+fourths output section, but all peers can read from this section.
+
+All sizes have to be rounded up to multiples of a mappable page in
+order to allow access control according to the section restrictions.
+
+### Configuration Space Registers
+
+#### Header Registers
+
+| Offset | Register               | Content                                              |
+|-------:|:-----------------------|:-----------------------------------------------------|
+|    00h | Vendor ID              | 110Ah                                                |
+|    02h | Device ID              | 4106h                                                |
+|    04h | Command Register       | 0000h on reset, writable bits are:                   |
+|        |                        | Bit 0: I/O Space (if Register Region uses I/O)       |
+|        |                        | Bit 1: Memory Space (if Register Region uses Memory) |
+|        |                        | Bit 3: Bus Master                                    |
+|        |                        | Bit 10: INTx interrupt disable                       |
+|        |                        | Writes to other bits are ignored                     |
+|    06h | Status Register        | 0010h, static value                                  |
+|        |                        | In deviation to the PCI specification, the Interrupt |
+|        |                        | Status (bit 3) is never set                          |
+|    08h | Revision ID            | 00h                                                  |
+|    09h | Class Code, Interface  | Protocol Type bits 0-7, see [Protocols](#Protocols)  |
+|    0Ah | Class Code, Sub-Class  | Protocol Type bits 8-15, see [Protocols](#Protocols) |
+|    0Bh | Class Code, Base Class | FFh                                                  |
+|    0Eh | Header Type            | 00h                                                  |
+|    10h | BAR 0                  | MMIO or I/O register region                          |
+|    14h | BAR 1                  | MSI-X region                                         |
+|    18h | BAR 2 (with BAR 3)     | optional: 64-bit shared memory region                |
+|    2Ch | Subsystem Vendor ID    | same as Vendor ID, or provider-specific value        |
+|    2Eh | Subsystem ID           | same as Device ID, or provider-specific value        |
+|    34h | Capability Pointer     | First capability                                     |
+|    3Eh | Interrupt Pin          | 01h-04h, must be 00h if MSI-X is available           |
+
+The INTx status bit is never set by an implementation. Users of the
+IVSHMEM device are instead expected to derive the event state from
+protocol-specific information kept in the shared memory. This
+approach is significantly faster, and the complexity of
+register-based status tracking can be avoided.
+
+If BAR 2 is not present, the shared memory region is not relocatable
+by the user. In that case, the hypervisor has to implement the Base
+Address register in the vendor-specific capability.
+
+Subsystem IDs shall encode the provider (hypervisor) in order to
+allow identifying potential deviating implementations in case this
+should ever be required.
+
+If its platform supports MSI-X, an implementation of the IVSHMEM
+device must provide this interrupt model and must not expose INTx
+support.
+
+Other header registers may not be implemented. If not implemented,
+they return 0 on read and ignore write accesses.
+
+#### Vendor Specific Capability (ID 09h)
+
+This capability must always be present.
+
+| Offset | Register            | Content                                        |
+|-------:|:--------------------|:-----------------------------------------------|
+|    00h | ID                  | 09h                                            |
+|    01h | Next Capability     | Pointer to next capability or 00h              |
+|    02h | Length              | 20h if Base Address is present, 18h otherwise  |
+|    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
+|        |                     | Bits 1-7: Reserved (0 on read, writes ignored) |
+|    04h | State Table Size    | 32-bit size of read-only State Table           |
+|    08h | R/W Section Size    | 64-bit size of common read/write section       |
+|    10h | Output Section Size | 64-bit size of output sections                 |
+|    18h | Base Address        | optional: 64-bit base address of shared memory |
+
+All registers are read-only. Writes are ignored, except to bit 0 of
+the Privileged Control register.
+
+When bit 0 in the Privileged Control register is set to 1, the device
+clears bit 0 in the Interrupt Control register on each interrupt
+delivery. This enables automatic interrupt throttling when
+re-enabling shall be performed by a scheduled unprivileged instance
+on the user side.
+
+An IVSHMEM device may not support a relocatable shared memory region.
+This support the hypervisor in locking down the guest-to-host address
+mapping and simplifies the runtime logic. In such a case, BAR 2 must
+not be implemented by the hypervisor. Instead, the Base Address
+register has to be implemented to report the location of the shared
+memory region in the user's address space.
+
+A non-existing shared memory section has to report zero in its
+Section Size register.
+
+#### MSI-X Capability (ID 11h)
+
+On platforms supporting MSI-X, IVSHMEM has to provide interrupt
+delivery via this mechanism. In that case, the MSI-X capability is
+present while the legacy INTx delivery mechanism is not available,
+and the Interrupt Pin configuration register returns 0.
+
+The IVSHMEM device has no notion of pending interrupts. Therefore,
+reading from the MSI-X Pending Bit Array will always return 0. Users
+of the IVSHMEM device are instead expected to derive the event state
+from protocol-specific information kept in the shared memory. This
+approach is significantly faster, and the complexity of
+register-based status tracking can be avoided.
+
+The corresponding MSI-X MMIO region is configured via BAR 1.
+
+The MSI-X table size reported by the MSI-X capability structure is
+identical for all peers.
+
+### Register Region
+
+The register region may be implemented as MMIO or I/O.
+
+When implementing it as MMIO, the hypervisor has to ensure that the
+register region can be mapped as a single page into the address space
+of the user, without causing potential overlaps with other resources.
+Write accesses to MMIO region offsets that are not backed by
+registers have to be ignored, read accesses have to return 0. This
+enables the user to hand out the complete region, along with the
+shared memory, to an unprivileged instance.
+
+The region location in the user's physical address space is
+configured via BAR 0. The following table visualizes the region
+layout:
+
+| Offset | Register                                                            |
+|-------:|:--------------------------------------------------------------------|
+|    00h | ID                                                                  |
+|    04h | Maximum Peers                                                       |
+|    08h | Interrupt Control                                                   |
+|    0Ch | Doorbell                                                            |
+|    10h | State                                                               |
+
+All registers support only aligned 32-bit accesses.
+
+#### ID Register (Offset 00h)
+
+Read-only register that reports the ID of the local device. It is
+unique for all of the connected devices and remains unchanged over
+their lifetime.
+
+#### Maximum Peers Register (Offset 04h)
+
+Read-only register that reports the maximum number of possible peers
+(including the local one). The permitted range is between 2 and 65536
+and remains constant over the lifetime of all peers.
+
+#### Interrupt Control Register (Offset 08h)
+
+This read/write register controls the generation of interrupts
+whenever a peer writes to the Doorbell register or changes its state.
+
+| Bits | Content                                                               |
+|-----:|:----------------------------------------------------------------------|
+|    0 | 1: Enable interrupt generation                                        |
+| 1-31 | Reserved (0 on read, writes ignored)                                  |
+
+Note that bit 0 is reset to 0 on interrupt delivery if one-shot
+interrupt mode is enabled in the Enhanced Features register.
+
+The value of this register after device reset is 0.
+
+#### Doorbell Register (Offset 0Ch)
+
+Write-only register that triggers an interrupt vector in the target
+device if it is enabled there.
+
+| Bits  | Content                                                              |
+|------:|:---------------------------------------------------------------------|
+|  0-15 | Vector number                                                        |
+| 16-31 | Target ID                                                            |
+
+Writing a vector number that is not enabled by the target has no
+effect. The peers can derive the number of available vectors from
+their own device capabilities because the provider is required to
+expose an identical number of vectors to all connected peers. The
+peers are expected to define or negotiate the used ones via the
+selected protocol.
+
+Addressing a non-existing or inactive target has no effect. Peers can
+identify active targets via the State Table.
+
+The behavior on reading from this register is undefined.
+
+#### State Register (Offset 10h)
+
+Read/write register that defines the state of the local device.
+Writing to this register sets the state and triggers MSI-X vector 0
+or the INTx interrupt, respectively, on the remote device if the
+written state value differs from the previous one. Users of peer
+devices can read the value written to this register from the State
+Table. They are expected differentiate state change interrupts from
+doorbell events by comparing the new state value with a locally
+stored copy.
+
+The value of this register after device reset is 0. The semantic of
+all other values can be defined freely by the chosen protocol.
+
+### State Table
+
+The State Table is a read-only section at the beginning of the shared
+memory region. It contains a 32-bit state value for each of the
+peers. Locating the table in shared memory allows fast checking of
+remote states without register accesses.
+
+The table is updated on each state change of a peers. Whenever a user
+of an IVSHMEM device writes a value to the Local State register, this
+value is copied into the corresponding entry of the State Table. When
+a IVSHMEM device is reset or disconnected from the other peers, zero
+is written into the corresponding table entry. The initial content of
+the table is all zeros.
+
+    +--------------------------------+
+    | 32-bit state value of peer n-1 |
+    +--------------------------------+
+    :                                :
+    +--------------------------------+
+    | 32-bit state value of peer 1   |
+    +--------------------------------+
+    | 32-bit state value of peer 0   |
+    +--------------------------------+ <-- Shared memory base address
+
+
+Protocols
+---------
+
+The IVSHMEM device shall support the peers of a connection in
+agreeing on the protocol used over the shared memory devices. For
+that purpose, the interface byte (offset 09h) and the sub-class byte
+(offset 0Ah) of the Class Code register encodes a 16-bit protocol
+type for the users. The following type values are defined:
+
+| Protocol Type | Description                                                  |
+|--------------:|:-------------------------------------------------------------|
+|         0000h | Undefined type                                               |
+|         0001h | Virtual peer-to-peer Ethernet                                |
+|   0002h-3FFFh | Reserved                                                     |
+|   4000h-7FFFh | User-defined protocols                                       |
+|   8000h-BFFFh | Virtio over Shared Memory, front-end peer                    |
+|   C000h-FFFFh | Virtio over Shared Memory, back-end peer                     |
+
+Details of the protocols are not in the scope of this specification.
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/60ece6d5722c072bd38a1a6666d03cd2a9327fe5.1578313099.git.jan.kiszka%40siemens.com.
