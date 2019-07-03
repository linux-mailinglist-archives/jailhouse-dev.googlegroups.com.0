Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBFMG6PUAKGQE7MNCYBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83f.google.com (mail-qt1-x83f.google.com [IPv6:2607:f8b0:4864:20::83f])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BB05E746
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 17:00:38 +0200 (CEST)
Received: by mail-qt1-x83f.google.com with SMTP id r57sf2924338qtj.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 08:00:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562166037; cv=pass;
        d=google.com; s=arc-20160816;
        b=tZ9JvSW5iV6Diahs71rhJBJntuNilfqHUNQ8ZNx5wB+bTJ0WWKgLTPh/VhYVyvBIjy
         Kh0aZpR1Ap9XNKirQTqHEUT3zrGi5xC/GEj20hQ2vrs11YAFDikQ9rxyHcL+/wUQpjbe
         6KnmMWklcfLZoWCAsujOx+laenUI/Rm8HdqaqW9pV/VA6BN2xe2mxkyzkJeNbQqasZwn
         7HGRCESCB1d476Qs4z2J6cOl89w3CL42DakYu0abkxkW6xaAJghWvg3Zc52plTFSZ1sj
         +35ZAn9i0voneQOCWB5mE4CpdLmGxPXFU9ytqpOEaU0uvQO9BzFGqX4rlZYT5oPwKOkB
         FndQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=kKT7VYJxyTvPcKzYAfvzU7ETKDHuHTr/ITtG8DmV+Mg=;
        b=iCKulx8C0XP5shK+eQOZHD21Yq7TZA1CW1did0t/8q5AE0bNWKKWmeeWYoXNsVD7jM
         dJ+GL8hMQ2ycEU9AcDfANjUV5QAZtRvE4M0hSF9CSwVrVzMsB+j5IMfEO+93P77C9xn7
         ud93YsKL5qY1VP2CujI4L97w4/vmFhRT2u8GlUXJHi6pHTcrBCQ8q3bMdvlZvlA/V9Ui
         Z1K+o3yk/rXLpDMoFGW0bmobruG/mSphsgJOOBUxf3fSjUkuKRwoNHqI/CJynQ5VZ27U
         noG+bkMOM6PKx91PMeFgSMj9kTaSTk5SQWocu62dicuuAH2pE/6b2oS/sIizz9LycP2N
         ucjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qEiu5R+h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kKT7VYJxyTvPcKzYAfvzU7ETKDHuHTr/ITtG8DmV+Mg=;
        b=R4G6b3wA3XqRl/J1BA989x1Y3mwfA80gEyZblkYeOQ//H48WVBOyY1llwJ+jHrXSxY
         E/q9+fuObY56uOPlK7hyihVNeBbO4MR/NiIJVXx2DWfgkiQC/KiOLqHDESYjC9Tl3IV4
         UsKsUhQWXGMVGfvFLYpnE/oivqnSyVmq6ABv2/ATIvloBG/Ay7BXVeNbzlM4UXIIhtMy
         WO3wzYnwPvfdejwlj6xyZIhtOGvZ68S0edOhK9pOiTx59XaGVk6zoXyRFd3CSwvxFNCM
         D8mXVUea1ouQRXYKy5tDo5w7Q6xlOSBhL/OjuXZSRRTKwHY/HpcHxJRbFB3CY41e1xKk
         MMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kKT7VYJxyTvPcKzYAfvzU7ETKDHuHTr/ITtG8DmV+Mg=;
        b=nLSmgjZy1mjV/oudltiif5CFMJGFxewIgJxFE5zOAqhwnUS12jr1wbbGbCLBel9fc/
         Am8spJC23MOT9UT2pCkn+z6y3mulTtx1Py9J9RpqAmnfFa15gg9AUB9/Ea1Z2HNtnKHE
         edlBHlTH4O0Fxtt/H/Uv5p+UdMQUxjQqsNe05BFXNv+rJkb8S0DKPIerFydN4HBrq9on
         DTnA3bf4NA2cc1iA8AkjS24hKp9ALvxHcJSIAv0lWM/VZ7YgxTRR9l2G2HDVjntT00V+
         KjHMyUvvfiYXxD5+II4Oy77NAfeguzne5vXfbCbJ32xu3DVOxUERo/5z03vKnlPj4EXk
         UIYw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUteQiSjVZoozvSojvbqHrAdn8fMZe6OLCFo5WCBPb2XZBnxkK
	N6EGmydb1hyYfKekZKxlZJU=
X-Google-Smtp-Source: APXvYqz3EyAvU0e1bW4YvHb95546a5F9uJMxGZRFzwbbobCYAgSaj3eTbE+JAgEGnhtFTkPFKQ9uHg==
X-Received: by 2002:a25:3b0a:: with SMTP id i10mr23157629yba.163.1562166037388;
        Wed, 03 Jul 2019 08:00:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:cf0c:: with SMTP id f12ls335220ybg.4.gmail; Wed, 03 Jul
 2019 08:00:36 -0700 (PDT)
X-Received: by 2002:a25:33d5:: with SMTP id z204mr23492708ybz.498.1562166036858;
        Wed, 03 Jul 2019 08:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562166036; cv=none;
        d=google.com; s=arc-20160816;
        b=jaAOcoQxkjh5M0zRYJc3to31V9SXMGjZMqooMds6Z4W/zY8UgbsakvnVmozJr71BKn
         yGN1DgSOv9k4Rv3kUo8iNiqy1vLhoICMD2eKtGlorfJ36H7hE14GB4KGIP3wFRNXgQnK
         qbIQjRRXMMjmqfZU8EduaeNN2XblTw2g0QXtTYZ6BjqUTyN80iAZPZ7s9g5LsyJmNtRv
         YkrAFMhV5sGORZpYvI0sNVysauSvktsGjBeGo9xqBvgvfsmX9P7Ex5pw/NEa/9F8iA+W
         /3TvWnUtU9OYGeBiQxCDzsqqa4OmoZWXcMib8UVKuftNofhthtTVhoV5aauNfZ7A33Jk
         MePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=mcpDgbu7tBNo2OVmVlXzHkPS00jHRvngHFxv7EECnsQ=;
        b=s/4HfmpZ6s1JBXOmkvdlIiUK2bWAzWSAIVS21Vp3n+sDQOt7Egwfmd+OSMTayLA3JL
         N2Vo58Lsr6vioYDYGEWhPuCtXO8m7oQhOwLYaFxG3Lla4DRNAHwCEQhuPdm52Qj4RfKg
         42pf5L9qLsaDSDnF043bQ2Hc+hrEkSC0QkrZ3LpXck45pIyStgdPDWfQLeBNxnuk7KvJ
         CvgIeCUtsOu4sryO+ikXL1xjAuFmtna+xNmvC76fjAdPqvKSsJ2g4BSuMmxhXyETlYwH
         ceUV9olRbtUBqUwRn8Zb/0WzGjVK4uny3obzgC7YGRAYSpK3ads+Me1JGw9yGqfc0oEr
         Euhg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qEiu5R+h;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id j15si109745ywa.3.2019.07.03.08.00.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 08:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Wed, 03 Jul 2019 08:00:35 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/877a53-5d228a@github.com>
Subject: [siemens/jailhouse] 6023ad: pyjailhouse: sysfs_parser: Ignore empty
 PCI bus re...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=qEiu5R+h;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 6023ad74f3fb862c5313f0f4d1e39b30e1f0e5f5
      https://github.com/siemens/jailhouse/commit/6023ad74f3fb862c5313f0f4d1e39b30e1f0e5f5
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Ignore empty PCI bus regions

On some systems the config generator permissively maps huge chunks of
PCI Bus MMIO space. This area needs to be intercepted by the hypervisor,
as parts of ivshmem-net devices may be behind that area.

Hence, ignore such regions.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: tuned comment]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cecfff071df8a5c75154acd80eda846c5f0541a7
      https://github.com/siemens/jailhouse/commit/cecfff071df8a5c75154acd80eda846c5f0541a7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/pci.c

  Log Message:
  -----------
  driver: Fix memory leak on errors

When some of_changeset_add/update_property fails, the property needs to
be freed. Do this unconditionally in the common error path, just
ensuring that prop is always initialized and, when consumed, set to
NULL or the next value. The latter is already the case, we only need to
NULL prop after the finaly of_changeset_update_property.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb95e9a32eccba9608630bdb36b8a8097bccbfdf
      https://github.com/siemens/jailhouse/commit/fb95e9a32eccba9608630bdb36b8a8097bccbfdf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/pci.c
    M driver/vpci_template.dts

  Log Message:
  -----------
  driver: Adjust vpci overlay to new DT overlay rules

Recent kernels reject our root-level address-cells and size-cells
presetting - and they are right: We were overruling the the settings of
the base DT which only worked by chance.

But if we cannot set those values anymore, dtc will start complaining
about us relying on undefined cells values - nice. So we need to remove
the ranges property in order to avoid that. Then dtc complains about
that this PCI host controller node is incomplete. So we also remove the
device_type from the static overlay. Even nicer.

Now we only need to add the missing pieces to the dynamic part and
account for the possible address-cells and size-cells values.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5d228abfa64be1abecf62f59ca0663c9a214ff52
      https://github.com/siemens/jailhouse/commit/5d228abfa64be1abecf62f59ca0663c9a214ff52
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-03 (Wed, 03 Jul 2019)

  Changed paths:
    M driver/vpci_template.dts

  Log Message:
  -----------
  driver: Declare virtual PCI controller dma-coherent

Just in case this matters for a user: We are coherent as we are purely
virtual.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/877a533caeff...5d228abfa64b

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/877a53-5d228a%40github.com.
For more options, visit https://groups.google.com/d/optout.
