Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7VO2LYAKGQE6OOVK6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB5132908
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Jan 2020 15:36:46 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id q26sf2006096wmq.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Jan 2020 06:36:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578407806; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZqrS61B8a2ggS7hOhUXLdxuMA4Ak6xUUIQgoOluRXR/eNeeC9CuxyE/hjuGQ9R1+xc
         6D304qkzBciyueVQLbNrBhKUfvE1wBz2s5kU8VwHwmOLTnMM7uSjqm75fWpfys8ROTdR
         2HxY490okgYUxc16ht+ESVeIdvq6N21eOyQJtsczMIxplmCQ+wIr5ZWaHpC/xbiGsNMz
         PPsy4XuUxQFyB9TPINuAG+N1ZVI860ZlBlNX7g4q4IvhWlD4LeeO5eP79u6/CXMpVKnz
         PlrgIdZAV/rkHqFvXuLj605uHP9Ok6rftlSdMv6zgm5Z5THW85i10zDJ7cHZF0D4NajK
         GtWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=wRDNh7tfu/i7pNtQ6DmXPjysNQJqzPL6ldbSiyPaB3M=;
        b=I6c9vRQPQ90d6k2y8Mgt5gz8OO56kyf6eXXlcQco5buC8/RGyOXHBP0pvyUO9XBqMy
         wqJ9TxJ1SWzVeQWUo2LRypfhQnfmjmUWCHdQ5yBFaRZOVILXx3B9+W44u2goNnL5gOe3
         tLppWcwjGGjS7hNPhx7dlxcM4m6tRYQr/fMruxziAym0S1CP2YebxFjw5yR0OMQK/wFK
         YW/nvNnJ14/SQGhJQWO1b9sp+K4U/ZSPNI/V3q2srtGuzHb7P6Ss2UuktVMx0Vcfldm3
         eM0ccbTiSnwEDEmu467q45i4Dh/Vdsjth8jFYvAiAAqQYLmBQXigrA/+X+Y1bYjiVJcK
         pGtg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wRDNh7tfu/i7pNtQ6DmXPjysNQJqzPL6ldbSiyPaB3M=;
        b=tgJ8GBBK+yEIGzdCwg8UTvOpnK0/+sruoapbiUAw7BHfveLaj58V+/P0F6bLL+lh2X
         PwN5lF/TPOxVFwUBk7jzYNDrCHC2x7uUPZQSCItbed4xg60vW1XxiSHKi9RCuMcNgnUw
         jUL2sUokBFrISpGdUBRGjFSe9aoYIZpQF2o/87q3Zp4JeueNUtDocjIK1pUi59jjyqe0
         WSMyC3gMLq94xZyxasgZAaPyf9zfSOVYrFPn6sgkvWz7FNYr4ep4PFLrHjmU5RIVMfSV
         8wSd8w3vKfZfe7YpQv/oMuM7ZJT1uE39mogMz5ADfaBR6rnd02F1sWwizArVshHdfgd3
         icvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=wRDNh7tfu/i7pNtQ6DmXPjysNQJqzPL6ldbSiyPaB3M=;
        b=JxSyQb6rUUci64SME1GWt0eJocFkMdA58e4dP7421a/MsKDihVVoXv6fQuanTJvK2N
         hNsluqIxAwkGyeQFTfLFO3PQ5yg54WHt82wB74L1JXLCZ5kdqCdycpy4W3j7ZeAE5D9l
         p5n7pxPzB/vUCdfixzoGAaHnOOY0S3mdXawKuqH6NVzuCTJiRl2xefuC4nVZX2kOp2XW
         8KzyJdLjGTOfXMJGhJzx+4WJWDApcbVGlkPGRstx2sesTWPSY25PxRUFk7rTNRgghgoQ
         3O2AJ4mLIjvSbXgU3ml7OalUvYsFZUBznoTVewYcmaWLmoDmG3ZuOHUSUW7tkasWx+qa
         0fIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWXLqIxj5n9i24YPO7i+WBeBVlLHUEXO7O0DCK/wzcJlHqQSDI+
	0boKDMAcQhOjxbeSZpVR9dE=
X-Google-Smtp-Source: APXvYqzeLd4BQTcLIN7pU99S9EMLLXFqJ5D/maNe85Zfcfxa7IZw4Iny4iXtvOHwX9bWwReMEZblzA==
X-Received: by 2002:a7b:c851:: with SMTP id c17mr42263239wml.71.1578407806485;
        Tue, 07 Jan 2020 06:36:46 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9808:: with SMTP id a8ls1033920wme.0.gmail; Tue, 07 Jan
 2020 06:36:45 -0800 (PST)
X-Received: by 2002:a05:600c:22d1:: with SMTP id 17mr42174227wmg.23.1578407805775;
        Tue, 07 Jan 2020 06:36:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578407805; cv=none;
        d=google.com; s=arc-20160816;
        b=sthCTsr79DVbwdVKVFXYLa3d3yUOAGeYAaZfut7H6tZrMAs10cLgNHHNoVbO4k0BlC
         45vkubG8OD/6dxOEA8kK/zCIdkj/vQKxG4NINWjkDXQEEX/dFheZr59nL52Gw59XNwzs
         BUtfazHUyesd8Mk5MWzKIh8e++e5IlpD58xWk6RPP6MJkSgLSPfP8jypgprKIpPG5FS6
         7owkU30Eq9B6wmBknCvyLySwadEWuM7y0THASwZBqEA6UaV6RFjPFYPwqBPPqDhfmjKy
         AswlvegQlyvD1SfXjuN6n0LyEBU7ASlsIpbjqGHklx45ezE2JhnKPecqSy4/Ve2Mm1SR
         CxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=61LglPc80TVQgx3YFK/Z47r/czhnWUfISVlpGCmLbLc=;
        b=vC06UDXgR9d/vVTUCKhge0xst4MwAVjV1zsLpWNiLM/90peuhWOLux1Uk4mMFbr1ja
         kfgB22flU04uAW7nUFgaH0smn2y51jirK1bwPA5dEC8aBHfgCShlNR6JdzhyKJztMzWn
         aIy8qwI6qCGW0NKf2Oefwp3f9pcTzsgTJuaT4/ph4t1epUJ2aSkwMsM2MChBUYN6nwqJ
         tSQqWFgIpcSJgzWJfKbzK0GF+sk3UQ9nWJNqgZP3X+O9d2QY4Gr8RA+mpkIq9SDhWCbF
         sfoRKQ5To2I6z+4uuVS/RralLWXTBLc7FKforFPLnDMG9z42rp2s8tzHHP0lDlH/bDo6
         COvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m2si1123672wmi.3.2020.01.07.06.36.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Jan 2020 06:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 007EaiOa000342
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jan 2020 15:36:44 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 007Eai7S011484;
	Tue, 7 Jan 2020 15:36:44 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH v2 2/3] docs/specs: Add specification of ivshmem device revision 2
Date: Tue,  7 Jan 2020 15:36:41 +0100
Message-Id: <5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578407802.git.jan.kiszka@siemens.com>
References: <cover.1578407802.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This imports the ivshmem v2 specification draft from Jailhouse where the
implementation is about to be merged now. The final home of the spec is
to be decided, this shall just simplify the review process at this
stage.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 docs/specs/ivshmem-2-device-spec.md | 376 ++++++++++++++++++++++++++++++++++++
 1 file changed, 376 insertions(+)
 create mode 100644 docs/specs/ivshmem-2-device-spec.md

diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2-device-spec.md
new file mode 100644
index 0000000000..d93cb22b04
--- /dev/null
+++ b/docs/specs/ivshmem-2-device-spec.md
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ddc4ca4f32bfab8971840e441b60a72153a2308.1578407802.git.jan.kiszka%40siemens.com.
