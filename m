Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBL5VUXXAKGQE3XHT6VI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id A2118F7462
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 13:57:19 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id i27sf2692134ljb.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Nov 2019 04:57:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573477039; cv=pass;
        d=google.com; s=arc-20160816;
        b=n7MYpOqRUBdBfoDzdjCcbBz5CzNix2glySjllkyTY+s2/iXpU2JD17AI/d3GAkJTFS
         imn4JGaU212mnywRgOEm6QMVtjU3xb5qs8MyYgjE1CwrFOFjSWgKnGa4yh6rrIIv4LN4
         4bHgkPBI+x3q5o9JpBFZDAf1xVy5BUevzsWlDl/9A8M6M0IyXDYKjCqLyuDl+f+JXySb
         V7Ye+maDhaWLwV5UGqreJp/+x8UYkiub8gFIlMfxHlcneJAkX7G6oYDZVpkUbLcgFTVE
         8LA0Oc4A/506Ovgo/K/BaqT4Zmhczln9P8fw7uRPovQivSAlHYMo8tOrExCp2ufIektM
         XfWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:mime-version:sender
         :dkim-signature;
        bh=Sb3qhy5k47H7r55E2yI2VnCnPIaCeqKMsT40YRTdemM=;
        b=Rdf82zow/SY/E1htcKGSNk1dkzQTt3oVcq1vFVycyWO9ezmKS/2KXTCLvcooCe/gFm
         JGlroFFw9GFaqVXxAZFk/io7c2OsZODtpPr1mvx4dASRlVxq5J4BjesuJulvH6fj+28P
         nBTq5tCxMevk14DbqISxrH6Whsj02ClVxuRHdTt6m4mnoLkiWV17IWwVka1O4oJ/hyUf
         1s1Gf6ohsJ3TqbnIdEipcxYXfmhPwRV3oAad02uiut1gbcBd4NioPpeqNLaVtUc5uS+G
         jN89wMv1sr/xXl5X5FrH2eoxP3DRpSQhLbIydUILQRkiU2pdVmrjpf8nRBFocgpOVLVx
         bB0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Sb3qhy5k47H7r55E2yI2VnCnPIaCeqKMsT40YRTdemM=;
        b=a4hj30Re2ySTcN2UuKYqGR743uz+S4kf3n9xHsMUSjC8IG9wzcjHR7ol0qy4fKcEOt
         1fup3o9dHpMRs105XViFV6g/AyYzM6XFXaHulX/ziBwgfZV7hIb4O5fEJa4+EP8SuxTa
         /29OBt+noyeOEru3vFG+NpFeejXUorT8Q5ebo9CZpbVTzNTWhq/FrIpaj7cc7CEKdNGw
         edKWaaKYzpWiQnJjWHRMWVC5cbyR7MZ3gAYVKpMgyor4K9iYxghvAspETbOmWdMOYHTx
         rub4LaHFsTEJeLg7UjPRpzKoOcD4WL3f/Jt0pYI2Ee32A8exAvYP4biYCEGEtX7DFzlK
         CxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Sb3qhy5k47H7r55E2yI2VnCnPIaCeqKMsT40YRTdemM=;
        b=JcuExzI0cw00+akdoCDI8Aklxz/S9W48VfCdco9S2Td10AkU7mff7H2zJYLoFy2nlK
         M+c0KwTEbY8qNIpe+83HAAl70ya8Jd1FXbXqvyC4lPIPRj4OausjDLkqU2+ygeqozwe3
         cwnYI1DBiX73QoCyqa7ENpvqzscVzkic+R51gF24qGirvLSLfKO9HZNR2qJWIy1zRnCe
         kM2MHbDwSOdh9jmoNLzop2IKvnlAoz3Hb647doyn7acaeazUA9dETFz6rlmqKHwqXRVa
         CMSMswfac64ViRZb04vz4qrMka+LoJeBHv/to5VXS0rebJ2RrfDUbrp2OkD8FCjOGMKm
         Nukg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIpzBHSIUDJhJs+Kulf5w71ykwIbX4G/kFcCdqUUBCcO5clXrV
	Z7+rN0KMUAT2+R1QTmjEhr4=
X-Google-Smtp-Source: APXvYqx15HAeKGa1eb0P3WdH92EllsRWSjZ/Gk/KTh3fUKrt6zIMrtPkP7ihZ1Yo73c5U9JH42L0LQ==
X-Received: by 2002:ac2:51dd:: with SMTP id u29mr15751583lfm.135.1573477039180;
        Mon, 11 Nov 2019 04:57:19 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:a09:: with SMTP id 9ls362832lfk.7.gmail; Mon, 11 Nov
 2019 04:57:18 -0800 (PST)
X-Received: by 2002:a19:ab11:: with SMTP id u17mr16108384lfe.78.1573477038348;
        Mon, 11 Nov 2019 04:57:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573477038; cv=none;
        d=google.com; s=arc-20160816;
        b=nix4DjfA3pLwY5QZYHhkUClIaP3LmNSOv1vFdyKiUn6WucfRwFZxFNKHXzbIpVoVy4
         PYP29q1uAAq4rBMZ5wdI6f3L5cQ1wcmTy+Qw5dqEQ/yB5Wkid6jAJ1CX1BzSUsLSrp7t
         ZTcnJkR4RVw2fBLmeDqaWbSHza+/6mTZtu9ah2ZDcQdaDsPfvI3crq5UzcWk4Ru7TRAz
         rN06y5XCniwt6MnKXttn90mCDimjmFAmUqwLv+putZSwG/5McHK4fKRqNTztsWxxBoqS
         14Z+fgVkkx/bb3ofnaPQjY6tper8W0ZihPsyX0qAoB8+WCgbs6UmgrCyu7o0oH+U1gQL
         ireg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:cc:to:from;
        bh=JISsc95BkHmQk0Hx/lvS8TCyhhtNLt8Y0YdNJFzjAl4=;
        b=OlsjzeVfpT0SM5UDFfUNEafJabkYTDZh75voMJqmSf4iFc4soEv2jqXY0zoiuZ6T0v
         yOfDILeq4VPmiEjnJFJBePmVNI1XRNsC8iSpVLZUwOsV8W2KaXwZ/Fajhk4gmbpaWGv0
         10IHT9zDl67mlQvXgl9urW9KQmSYtifNEMj423jNo86pqMz5+QsmkLjMhx2dwTAqh9Ii
         bUvthOmv7U3OJIiYyQreJu2wMOlbiFCIZ3JOcdRz6WPT8IJ85HDVT98OowpyDlUL/3UO
         9c89kWGATwzwuuH1QwFQF9bteLYB10Syo7sMtuH9H1DuHhHsNH24mf7KcMrQXktF8lo1
         7JWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z9si1198867ljj.4.2019.11.11.04.57.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 04:57:14 -0800 (PST)
Received-SPF: temperror (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS error) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id xABCvCrh020384
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Nov 2019 13:57:13 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xABCvCBF010919;
	Mon, 11 Nov 2019 13:57:12 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Markus Armbruster <armbru@redhat.com>,
        Claudio Fontana <claudio.fontana@gmail.com>, liang yan <lyan@suse.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, Hannes Reinecke <hare@suse.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [RFC][PATCH 2/3] docs/specs: Add specification of ivshmem device revision 2
Date: Mon, 11 Nov 2019 13:57:11 +0100
Message-Id: <f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1573477032.git.jan.kiszka@siemens.com>
References: <cover.1573477032.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=temperror
 (google.com: error in processing during lookup of jan.kiszka@siemens.com: DNS
 error) smtp.mailfrom=jan.kiszka@siemens.com
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

This imports the ivshmem v2 specification draft from Jailhouse. Its
final home is to be decided, this shall just simplify the review process
at this stage.

Note that specifically the Features register (offset 08h) is still under
consideration. In particular, its bit 0 seems useless now as its benefit
to guests, specifically when they want to be portable, is close to zero.
Maybe the register should still be kept, with all bits RsvdZ, for easier
extensibility.

The rest appears now rather mature and reasonably implementable, as
proven also by a version for Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 docs/specs/ivshmem-2-device-spec.md | 333 ++++++++++++++++++++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 docs/specs/ivshmem-2-device-spec.md

diff --git a/docs/specs/ivshmem-2-device-spec.md b/docs/specs/ivshmem-2-device-spec.md
new file mode 100644
index 0000000000..98cfde585a
--- /dev/null
+++ b/docs/specs/ivshmem-2-device-spec.md
@@ -0,0 +1,333 @@
+IVSHMEM Device Specification
+============================
+
+** NOTE: THIS IS WORK-IN-PROGRESS, NOT YET A STABLE INTERFACE SPECIFICATION! **
+
+The Inter-VM Shared Memory device provides the following features to its users:
+
+- Interconnection between up to 65536 peers
+
+- Multi-purpose shared memory region
+
+    - common read/writable section
+
+    - unidirectional sections that are read/writable for one peer and only
+      readable for the others
+
+    - section with peer states
+
+- Event signaling via interrupt to remote sides
+
+- Support for life-cycle management via state value exchange and interrupt
+  notification on changes, backed by a shared memory section
+
+- Free choice of protocol to be used on top
+
+- Protocol type declaration
+
+- Unprivileged access to memory-mapped or I/O registers feasible
+
+- Discoverable and configurable via standard PCI mechanisms
+
+
+Hypervisor Model
+----------------
+
+In order to provide a consistent link between peers, all connected instances of
+IVSHMEM devices need to be configured, created and run by the hypervisor
+according to the following requirements:
+
+- The instances of the device need to be accessible via PCI programming
+  interfaces on all sides.
+
+- The read/write shared memory section has to be of the same size for all
+  peers and, if non-zero, has to reflect the same memory content for them.
+
+- If output sections are present (non-zero section size), there must be one
+  reserved for each peer with exclusive write access. All output sections
+  must have the same size and must be readable for all peers. They have to
+  reflect the same memory content for all peers.
+
+- The State Table must have the same size for all peers, must be large enough to
+  hold a state values of all peers, and must be read-only for the user.
+
+- State register changes (explicit writes, peer resets) have to be propagated
+  to the other peers by updating the corresponding State Table entry and issuing
+  an interrupt to all other peers if they enabled reception.
+
+- Interrupts events triggered by a peer have to be delivered to the target peer,
+  provided the receiving side is valid and has enabled the reception.
+
+- All peers must have the same interrupt delivery features available, i.e. MSI-X
+  with the same maximum number of vectors on platforms supporting this
+  mechanism, otherwise INTx with one vector.
+
+
+Guest-side Programming Model
+----------------------------
+
+An IVSHMEM device appears as a PCI device to its users. Unless otherwise noted,
+it conforms to the PCI Local Bus Specification, Revision 3.0 As such, it is
+discoverable via the PCI configuration space and provides a number of standard
+and custom PCI configuration registers.
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
+The first section consists of the mandatory State Table. Its size is defined by
+the State Table Size register and cannot be zero. This section is read-only for
+all peers.
+
+The second section consists of shared memory that is read/writable for all
+peers. Its size is defined by the R/W Section Size register. A size of zero is
+permitted.
+
+The third and following sections are unidirectional output sections, one for
+each peer. Their sizes are all identical. The size of a single output section is
+defined by the Output Section Size register. An output section is read/writable
+for the corresponding peer and read-only for all other peers. E.g., only the
+peer with ID 3 can write to the fourths output section, but all peers can read
+from this section.
+
+All sizes have to be rounded up to multiples of a mappable page in order to
+allow access control according to the section restrictions.
+
+### Configuration Space Registers
+
+#### Header Registers
+
+| Offset | Register               | Content                                              |
+|-------:|:-----------------------|:-----------------------------------------------------|
+|    00h | Vendor ID              | 1AF4h                                                |
+|    02h | Device ID              | 1110h                                                |
+|    04h | Command Register       | 0000h on reset, implementing bits 1, 2, 10           |
+|    06h | Status Register        | 0010h, static value (bit 3 not implemented)          |
+|    08h | Revision ID            | 02h                                                  |
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
+If BAR 2 is not present, the shared memory region is not relocatable by the
+user. In that case, the hypervisor has to implement the Base Address register in
+the vendor-specific capability.
+
+Other header registers may not be implemented. If not implemented, they return 0
+on read and ignore write accesses.
+
+#### Vendor Specific Capability (ID 09h)
+
+| Offset | Register            | Content                                        |
+|-------:|:--------------------|:-----------------------------------------------|
+|    00h | ID                  | 09h                                            |
+|    01h | Next Capability     | Pointer to next capability or 00h              |
+|    02h | Length              | 18h or 20h                                     |
+|    03h | Privileged Control  | Bit 0 (read/write): one-shot interrupt mode    |
+|        |                     | Bits 1-7: RsvdZ                                |
+|    04h | State Table Size    | 32-bit size of read-only State Table           |
+|    08h | R/W Section Size    | 64-bit size of common read/write section       |
+|    10h | Output Section Size | 64-bit size of unidirectional output sections  |
+|    18h | Base Address        | optional: 64-bit base address of shared memory |
+
+All registers are read-only, except for bit 0 of the Privileged Control
+register.
+
+When bit 0 in the Privileged Control register is set to 1, the device clears
+bit 0 in the Interrupt Control register on each interrupt delivery. This enables
+automatic interrupt throttling when re-enabling shall be performed by a
+scheduled unprivileged instance on the user side.
+
+If an IVSHMEM device does not support a relocatable shared memory region, BAR 2
+must not be implemented by the provider. Instead, the Base Address register has
+to be implemented to report the location of the shared memory region in the
+user's address space.
+
+A non-existing shared memory section has to report zero in its Section Size
+register.
+
+#### MSI-X Capability (ID 11h)
+
+On platforms supporting MSI-X, IVSHMEM has to provide interrupt delivery via
+this mechanism. In that case, the legacy INTx delivery mechanism is not
+available, and the Interrupt Pin configuration register returns 0.
+
+The IVSHMEM device has no notion of pending interrupts. Therefore, reading from
+the MSI-X Pending Bit Array will always return 0.
+
+The corresponding MSI-X MMIO region is configured via BAR 1.
+
+The MSI-X table size reported by the MSI-X capability structure is identical for
+all peers.
+
+### Register Region
+
+The register region may be implemented as MMIO or I/O.
+
+When implementing it as MMIO, the hypervisor has to ensure that the register
+region can be mapped as a single page into the address space of the user. Write
+accesses to MMIO region offsets that are not backed by registers have to be
+ignored, read accesses have to return 0. This enables the user to hand out the
+complete region, along with the shared memory, to an unprivileged instance.
+
+The region location in the user's physical address space is configured via BAR
+0. The following table visualizes the region layout:
+
+| Offset | Register                                                            |
+|-------:|:--------------------------------------------------------------------|
+|    00h | ID                                                                  |
+|    04h | Maximum Peers                                                       |
+|    08h | Features                                                            |
+|    0Ch | Interrupt Control                                                   |
+|    10h | Doorbell                                                            |
+|    14h | State                                                               |
+
+All registers support only aligned 32-bit accesses.
+
+#### ID Register (Offset 00h)
+
+Read-only register that reports the ID of the local device. It is unique for all
+of the connected devices and remains unchanged over their lifetime.
+
+#### Maximum Peers Register (Offset 04h)
+
+Read-only register that reports the maximum number of possible peers (including
+the local one). The supported range is between 2 and 65536 and remains constant
+over the lifetime of all peers.
+
+#### Features Register (Offset 08h)
+
+Read-only register that reports features of the local device or the connected
+peers. Its content remains constant over the lifetime of all peers.
+
+| Bits | Content                                                               |
+|-----:|:----------------------------------------------------------------------|
+|    0 | 1: Synchronized shared memory base address                            |
+| 1-31 | RsvdZ                                                                 |
+
+If "synchronized shared memory base address" is reported (bit 0 is set), the
+shared memory region is mapped at the same address into the user address spaces
+of all connected peers. Thus, peers can use physical addresses as pointers when
+exchanging information via the shared memory. This feature flag is never set
+when the shared memory region is relocatable via BAR 2.
+
+#### Interrupt Control Register (Offset 0Ch)
+
+This read/write register controls the generation of interrupts whenever a peer
+writes to the Doorbell register or changes its state.
+
+| Bits | Content                                                               |
+|-----:|:----------------------------------------------------------------------|
+|    0 | 1: Enable interrupt generation                                        |
+| 1-31 | RsvdZ                                                                 |
+
+Note that bit 0 is reset to 0 on interrupt delivery if one-shot interrupt mode
+is enabled in the Enhanced Features register.
+
+The value of this register after device reset is 0.
+
+#### Doorbell Register (Offset 10h)
+
+Write-only register that triggers an interrupt vector in the target device if it
+is enabled there.
+
+| Bits  | Content                                                              |
+|------:|:---------------------------------------------------------------------|
+|  0-15 | Vector number                                                        |
+| 16-31 | Target ID                                                            |
+
+Writing a vector number that is not enabled by the target has no effect. The
+peers can derive the number of available vectors from their own device
+capabilities and are expected to define or negotiate the used ones via the
+selected protocol.
+
+Addressing a non-existing or inactive target has no effect. Peers can identify
+active targets via the State Table.
+
+The behavior on reading from this register is undefined.
+
+#### State Register (Offset 14h)
+
+Read/write register that defines the state of the local device. Writing to this
+register sets the state and triggers interrupt vector 0 on the remote device if
+the written state value differs from the previous one. The user of the remote
+device can read the value written to this register from the State Table.
+
+The value of this register after device reset is 0.
+
+### State Table
+
+The State Table is a read-only section at the beginning of the shared memory
+region. It contains a 32-bit state value for each of the peers. Locating the
+table in shared memory allows fast checking of remote states without register
+accesses.
+
+The table is updated on each state change of a peers. Whenever a user of an
+IVSHMEM device writes a value to the Local State register, this value is copied
+into the corresponding entry of the State Table. When a IVSHMEM device is reset
+or disconnected from the other peers, zero is written into the corresponding
+table entry. The initial content of the table is all zeros.
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
+The IVSHMEM device shall support the peers of a connection in agreeing on the
+protocol used over the shared memory devices. For that purpose, the interface
+byte (offset 09h) and the sub-class byte (offset 0Ah) of the Class Code register
+encodes a 16-bit protocol type for the users. The following type values are
+defined:
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f5996d934d24775160bcedbf28ac975a95d91101.1573477032.git.jan.kiszka%40siemens.com.
