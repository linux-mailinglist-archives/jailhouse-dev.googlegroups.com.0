Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVXWXLTAKGQEYSNHKEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DAF13ED9
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 12:30:47 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id f8sf5828545pgp.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 03:30:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557052246; cv=pass;
        d=google.com; s=arc-20160816;
        b=vjuYATo6u4Ajno/eToHDsDDycAuUIGJVn5tRyr458p/kp4FzqI+W4PQLcGdWZPEFSD
         wfd7duvAPJzSrqt3waOmD6EhuFCt/A3jKRljCq6HP28TfaUy39tOAz8IFVn1hptLeVd+
         +OVRWEtyt6fev+OSxWhmHd/9BvXnlU7Z8J/EZITCoUbwVDA9ZuTuTWXhisdevkFwJ/0D
         jXnEK8SchKYyi83Pdsjwq7hDWjQTr6afp/1OzxO0t8I7MWfZVzVkYhuxGQ/RDvOqS8w4
         4dhu0vBlKvRReDuKEbrTOe9LEbdscLrTtlGWAd0GVS48yw3g2FuXVTT4pxIo1K2nh14h
         7qlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=M9973D5Yu/3IRn34J/jHQPCcpEksDx4WGjxHG3q6FsQ=;
        b=WHplaQMr3+OqaPNYee5/yRJkCYi7qK3qreohnb8CPWbRQ7yMBMt/zttD9pzTaQP2u3
         czC1XqYrGaWfCczE530dsvqYWUmMDE885z9PIh9MYJvoTJUYtaY5gV3w5pFp5YQuTs5h
         oAJHrrD3y3Q0QFy/UWcIZTiskB7zHt1RJwX92h99w4uV078fN0VkH9fvajYh8uHqNGp/
         I+SSy8qBYBZvi9yHT3ED6X+VnMmyQVlZOYnO0M4lyr3M+BiKyDky62SIGNE/M2MoMuFc
         QC9kfMcwNfuuDVvCy8I5/lfkS/DOYC8cQYuVn1jjLuEfKFKAuO3+0G6WBw60V0qLgYCU
         t6CA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=b3C0IPm7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M9973D5Yu/3IRn34J/jHQPCcpEksDx4WGjxHG3q6FsQ=;
        b=WBaL6jLG91jUn+14Pmo6XQkjhGZazfbZRXtP91SWFrWItrl2MTtS/Rijteu9E8T0FD
         kd6Df211aYi9u3WqczN16I1YrnmP5HUNsE+AZ273Q1ObHJXF+iqSk7dOnsCfwdiwR2uT
         kMqqXisQSkmSP9N+hwAsrGi3TSzdrC+E9hjGK7VZ9uoivtbN41N9aVB7TXdKE+44Osqm
         K1Zy8Xy6zAvGa7xLrOnnpTmMTHqtiERBL0z2rfu3MwLz+DQd31AUCJ7H1G6LuRd1lQmP
         LhUtLCRuB10DTpbSBjSpG6vcfRGT+aPMMTtiZUlzn89PRcPchN996uh4Ny8GPs/us0El
         w/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=M9973D5Yu/3IRn34J/jHQPCcpEksDx4WGjxHG3q6FsQ=;
        b=HX0A22XEStDokxfZZioY6P+pJQqgRTr3XKU7N8vn6CCTkQ1u8gebaaB62qbejaOQSA
         T733I4tIhj0XmucG25m4Dgk5LOYJTXKi8QXi11WEcQKOknR9U/B3NxZzZvJvejLL3kP9
         UGZI7ti5zeW9NFI7X/+cl7lvtHvUh+d/g4kxVfe6sTsVqj40s0NPKxIUFb36pl7YAv62
         DF8Qf/VQk9J5doOK/H0pIW1oerhZpfoYBbDSR0ATP/Jc43FBtiIlA6GZ58eTPcd6uWto
         7iW0NG75MJLt0Sjpg/vLhZKZ+9pIEq6uzL6OvnHxpVDVgrhMydB/INJIgBbJjUI+n+XD
         2n+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVKILBE/aVerCWNU45YB35rzLihrrlGJdNPy0L3jJYoIKo3j/Jz
	errVnpDqQ0yHd7twXWQiuLY=
X-Google-Smtp-Source: APXvYqwqL0HK92gxVD+gpEFdJZNRX2GIttr5Z7IQ84ag3db3xXqnwK6GoEzLN4uRi7kZ2Vh8ZG8Sig==
X-Received: by 2002:a63:360c:: with SMTP id d12mr23483569pga.404.1557052246659;
        Sun, 05 May 2019 03:30:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:8287:: with SMTP id s7ls2686722pfm.7.gmail; Sun, 05 May
 2019 03:30:46 -0700 (PDT)
X-Received: by 2002:a63:5020:: with SMTP id e32mr23253065pgb.215.1557052246217;
        Sun, 05 May 2019 03:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557052246; cv=none;
        d=google.com; s=arc-20160816;
        b=FdiIC3bswDpgDCf9EBwHxYyQzLQkwOChKLrJEktKpDlz08ZoBmsFC1XJbwwK//OVr6
         VjnHrhZy45cP228Ns4/49KttB6XNnVF1XwESDKSv1HpkuVTh66aXjuLC1XjktUafn4D6
         xSU/eWfrrk/iJ1Mk09SBhSX1rH3nuPApLbhyCW6XpDsQwZZOjiyKiGN96WanLl1DC7nE
         ChJSANRt/dj8/Qf0+8Wxdn0W4VL6BylUR0RDPqQ/XvEsDFVXW8joXLFICQs+qhJqsD5Y
         +dGMi7wrZzCgVeMwOIPuX/f/gU3x4gqliq8PoX2riHpjxsK6DBHp1HPHkR5LqeTb4MIt
         b9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=4U5YdeGo6ERdphNyMXHnp0G9eudwra7TPcSOYTLnv8U=;
        b=A1wU9WfMV1gDRkWWH+f1CmSzyjKWwPnTprpx6rboVPB3IxbLHQa6uMEo2ZshCbchnq
         9n+6uU0ow78+0lEO5H6i8C+DK2LuYgQL8gkWOFklDlbGMBzS/NqK/yHx5JiTHbEwkHcg
         0EiaQuSlCQt5mOokvlBFG8f0CF6qQmepFNPM/UqvOqR4ws5OfQzwS0p64uZWoltw2MCC
         6czhTd+z0u4+OoxNKCy3fD1Z13ss23eKjEKg2jvuXZ9CA+nuUSGZ5U7CrWK7VA8atYA4
         MhFxV3Y7hO+ZS/qb+AvF/EUGkl0QUxmYbqbWqKN0OqCmWCP2K/TiAGyoE4Sgcgn4bAOj
         cdTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=b3C0IPm7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id g31si359222plb.4.2019.05.05.03.30.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 03:30:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Sun, 05 May 2019 03:30:45 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/27ca52-d235bd@github.com>
Subject: [siemens/jailhouse] 29796b: ci: Work around incomplete ca-chain of
 scan.coveri...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=b3C0IPm7;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 29796b562f14ef96cca0b0e3d495a7100c6cb2fa
      https://github.com/siemens/jailhouse/commit/29796b562f14ef96cca0b0e3d495a7100c6cb2fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-26 (Fri, 26 Apr 2019)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Work around incomplete ca-chain of scan.coverity.com

It's missing the intermediate certificate from "Entrust Certification
Authority - L1K". Download that separately and inject it into the script
download to fix curl failing on that. See also
https://travis-ci.community/t/certificate-issue-during-coverity-build/3153

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 49de7b7e47e6a997941c1f45453c249c31537a49
      https://github.com/siemens/jailhouse/commit/49de7b7e47e6a997941c1f45453c249c31537a49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Refactor loops in pci_prepare_handover and pci_config_commit

No functional change, just reduction of indention which will also be
beneficial for upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a20e9b56245d64efd9d31ab442132bc9945517e7
      https://github.com/siemens/jailhouse/commit/a20e9b56245d64efd9d31ab442132bc9945517e7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Only call pci_suppress_msix() for root cell

It is harmless to call pci_suppress_msix(..., false) it also for
non-root cells because it just writes back the config space register
content. But it is unneeded and, thus, potentially confusing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 699f4de9a0dd844d981a0ff869b3d725511eb54c
      https://github.com/siemens/jailhouse/commit/699f4de9a0dd844d981a0ff869b3d725511eb54c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Call arch_pci_suppress_msi also on re-enabling

This will allow to move the injection to the end of the suppression
phase.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 97c68dff145689d0a14b61e8ae4132bd0696917c
      https://github.com/siemens/jailhouse/commit/97c68dff145689d0a14b61e8ae4132bd0696917c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h

  Log Message:
  -----------
  pci: Move MSI vector injection to the end of suppression

This fixes a long-pending issue that actually prevented the injection
when interrupt remapping was in use in the root cell on x86: We are
unable to translate the remapping entry into a physical message before
the 2nd level page table for the root is fully populated. This happens
in init_late, thus after the suppression request. The result is that we
only read invalid messages from the redirection table and did nothing.

By moving the injection to the config-commit phase, we have that full
access to the guest memory and can build the correct message.

Fixes: b50614282cff ("core: Virtualize legacy MSI for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cbbb49ef51e6621ecb85fd0af1655ad584e30021
      https://github.com/siemens/jailhouse/commit/cbbb49ef51e6621ecb85fd0af1655ad584e30021
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Move edge interrupt injection at the end of suppression

Analogously to MSI: When interrupt remapping is enabled in Linux, we
cannot evaluate the remapping table before the config-commit phase, thus
will never inject a message when trying that earlier.

Fixes: f651754c72e3 ("x86: Virtualize IOAPIC redir table for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d235bde2a4738b4cddb1df926a39b8a1e11c0acc
      https://github.com/siemens/jailhouse/commit/d235bde2a4738b4cddb1df926a39b8a1e11c0acc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Simplify ioapic_mask_cell_pins

After ioapic_get_or_add_phys is called, the shadow_redir_table is
populated with the guest register content. As ioapic_mask_cell_pins is
only called after that function, we can read the mask state from the
shadow table and safe a register access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/27ca523c0747...d235bde2a473

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
