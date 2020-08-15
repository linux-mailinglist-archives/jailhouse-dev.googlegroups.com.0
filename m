Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMU2334QKGQEJNXKYEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa37.google.com (mail-vk1-xa37.google.com [IPv6:2607:f8b0:4864:20::a37])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A42450C1
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 09:22:28 +0200 (CEST)
Received: by mail-vk1-xa37.google.com with SMTP id n6sf3171784vkm.20
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Aug 2020 00:22:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597476147; cv=pass;
        d=google.com; s=arc-20160816;
        b=BGWqBF2GY+9qrcEK7PvlSffwHl83Alh10GoaQrABWw13ZflppCJqlLMngXZg0mTncT
         XCGacouNbYkOGWXcTp+2Ot5rUfwI//4vwWnPWneR7MDGyJcJyQ7omtqvxfgFcxosG7iZ
         ah0Qgl9fEQBGpneawK2twi+gx9qOqhVHH/rVKMldVgIyZj/+SJxj5koqnxZFUojDH7iI
         pNKelYIO6HLCfUJ6zkRN3/swtX6cZdF2PRGnVUv9Bx5OaUnyv0nHBR13V10FV9jflHSV
         aRHCWmbFcCvN+EhaKDav4gk3Vkn3bFYkwDam0AOM2FF1cWV7sn87ktXTBjsifc5lS4WG
         v87g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YjUYK2OHKa3NEnTlZfML8shdduLKWQbwBjExRQrB4R4=;
        b=y3VNmjhSJYb8Pn5WZBDlz8HGf4dwRz7tESC9V+yAchZ3/K7thKm8BeqjFa9fgiDeXZ
         w32JuLjmFYLNyZdrH0iM8CID22KYY5k/ZR41JsUHmhdacCdPU4Q0BYHuXj/iZB+C58BK
         5RPW0cRiPl61vsdVp3357i8iRp4mgMtqQ50uIWmMZoYNWP/iZJccKez2aYh7papiHBTI
         4mjwhtIst9IfXQN95UDFOx0mL4kFF93VXuaFKtL3B6N0AvGUijD/SckPh6jcNi28tgk4
         zr0LiXbIFKeS9BtCnLFMpt2nMDSNNY45cpp4iEH6GAR06Eat3zdQ8iIUFeCszJzknSKZ
         Nwow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m094BsYM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YjUYK2OHKa3NEnTlZfML8shdduLKWQbwBjExRQrB4R4=;
        b=Hq3B6tmSBUWJfYLvTZKIAbswY6GSNuXhMP7TWJjefq2ZhirduMCjHFYzP1YBF6qWKh
         Y83I+w1s8gKbRpPZB7754c4dgWL73XzivhMvYFkzFezdeZ3jE8m0qjNG8qD+dWS5jsYs
         c2Fn5Uf//oWM7+JcZ1naTXEfynSmE4p4byDbxdtnX0tbC/tsKrYft1lYcfbAlcr1EoYK
         fuy214k8lDAVDifJepkD0NZ8Mf5348R64W7/kEPdsrGTS9GrOrxVFIOjJXkpdo9QxLll
         C/Ks3gnm850s1vE6ZM271mvSY04/ilTtHI7WkxBbc1pYgF5QhCS4BDOsvvhtBgFbNAHt
         BZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YjUYK2OHKa3NEnTlZfML8shdduLKWQbwBjExRQrB4R4=;
        b=ah0VDehmgLuYeEfriC3kM4Kzs20BtruukDIvwdzmPeXqUNJ4ORthJ+aS6wgvHxFMdD
         IWLaCKHHun1Xp4FKubJ5CVS7oYDdnITGGgIF/Oo8RdWgzfNunch7Pp0uSU59JKjeEcsc
         rWCKUaSHtUbVrB+LdsTWR4xJTHxl3XcQ0BZOrwfBTc2w7ebe6dq7D6PEmMkgU4OO5cA3
         cznCeRs9uT6Q3fjVNKas6xzPppRw5sUnLdx+4zVcUbGSywc44zt2gQu3n07NAWyQ86To
         WqG4PqWhMyBqPEkEoue/YiU2j81grBnY6UQrPDzIRdMI2IYGkZefjBoMTCJYWNYrSeb1
         8Rbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533gBgemki2uPz0u2gq2Mbo4iDRQs9oPKQO9H3t7Q6+C7qzTwBdT
	Y2mu+jQ39uFG6wSM8YC6Ab4=
X-Google-Smtp-Source: ABdhPJzSTG23SMIY9yFTICy2MOPIF3E2/SXtvDmw59OJcAmvIMCs5ReM9n27qrjbLCtmRjS+fOmxpQ==
X-Received: by 2002:a67:fe41:: with SMTP id m1mr3564128vsr.109.1597476146892;
        Sat, 15 Aug 2020 00:22:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:1d84:: with SMTP id l4ls778792uak.9.gmail; Sat, 15 Aug
 2020 00:22:26 -0700 (PDT)
X-Received: by 2002:ab0:1390:: with SMTP id m16mr3303425uae.132.1597476146234;
        Sat, 15 Aug 2020 00:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597476146; cv=none;
        d=google.com; s=arc-20160816;
        b=d3Jxmvlqd4P48vsS7yXmOBXYozD6rK9UT7dBZHq1i3XyHsJXLFwYv1yjc3KDGP5t/e
         F7bJX7dAfwA4uTsDfuUVTPrfZrmjpN6uqtXJFY08UiYqeBMRDlywr0jnurg0yQlcB9UX
         BoAozwWxj6Cj0X+Vluhm1LwU8gUznCqHl5hy80WKaTFWdsU3nMXH9Aku7NBEF6VUanqY
         BV9bwGH+oL1qE0s4s1OhwZeHTQcSWvtt6yJZmWPek+dvajcnqo8XLtL22OnB5NtKF9Fs
         6kWMds5+an7GUFlo4jSpVK0pqWd8bswaoF+rFbPP2ig8cgXFeVm5ODczXMPTWlQQ5lnS
         Gfdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=GQXmpOG99IJcogEQHAS1h+SI1Kfa+8GQmmaio653RrQ=;
        b=MpXMTzjvZMS9BCC0DjtdlSs36BX0R2NQcmgIbwkVt1DItNCBs10gh48anzgWfeY9KS
         1UsblQJJpO5Pz2yvYvRc8lanev6dTCDo1no+v9CmZExulzUiUV/dgOrKN5LDYWTGIZBx
         PcfvvZJDr0HEqnyRDiajjyxpspuSDy2zUkutm/ZayZ65gzEOuAaI7aivUQtGnlMQ8Fz7
         mEDRR8ix35g0MuVdxB5/H3O8XL3owBJuyWw29YFOIBk2EBmhgfb6F7Gqa5pgGzQrDNiY
         +0lklcDb0MINtdSceOIgOo1MBtwupl1Ufpzqdlc7crzcCqdqmDQiag0frfC0q6fipWtt
         aWeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m094BsYM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id s126si639769vkd.1.2020.08.15.00.22.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Aug 2020 00:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-1ac52d7.ash1-iad.github.net (github-lowworker-1ac52d7.ash1-iad.github.net [10.56.25.52])
	by smtp.github.com (Postfix) with ESMTP id EB08EE1E11
	for <jailhouse-dev@googlegroups.com>; Sat, 15 Aug 2020 00:22:25 -0700 (PDT)
Date: Sat, 15 Aug 2020 00:22:25 -0700
From: Andrej <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/42b1f5-f02a43@github.com>
Subject: [siemens/jailhouse] c31310: pyjailhouse: config_parser: store binary
 format sp...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=m094BsYM;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: c313108807d415ea594f69ad673a57359c927b35
      https://github.com/siemens/jailhouse/commit/c313108807d415ea594f69ad673a57359c927b35
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: store binary format specification in struct.Struct

Improves its handling in the code and slightly increases the overall
performance as well.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c2f3065768bd7fdb40cd95539ede1895c238f553
      https://github.com/siemens/jailhouse/commit/c2f3065768bd7fdb40cd95539ede1895c238f553
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: move parsing into class methods

... and use constructor for initialization only. This separation
provides clarity on how to instantiate config components.

This commit also serves as preparation for following one.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8905d5e91ea047b80861e33e3d5b038652edff25
      https://github.com/siemens/jailhouse/commit/8905d5e91ea047b80861e33e3d5b038652edff25
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: consolidate binary parsing into CStruct class

The class slots define component fields in a more grounded way.
This greatly simplifies definition of parseable compoments.

The first `__slots__` tuple in each class defines a constant list of
fields and also the corresponding binary ones in the C struct.
`_BIN_FIELD_NUM` ensures that subsequent slot additions are ignored by
CStruct as they must be constructed by the owning class itself.

For complex parsing the class method `parse` needs to be overridden,
see `CellConfig`.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1cfb4662c9b681d5cbb242541dca045f548f412e
      https://github.com/siemens/jailhouse/commit/1cfb4662c9b681d5cbb242541dca045f548f412e
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: use I/O stream instead slice of bytes

This enables more flexibility in input types as long as they provide
binary I/O capabilities.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 61ff21fc69999f0e58e3222905c46e4716c9b202
      https://github.com/siemens/jailhouse/commit/61ff21fc69999f0e58e3222905c46e4716c9b202
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: parse pin_bitman in Irqchip as list

Just like the array of 4 in the C struct.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f02a43a5fb3c870c80606ced065502211290acab
      https://github.com/siemens/jailhouse/commit/f02a43a5fb3c870c80606ced065502211290acab
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-08-15 (Sat, 15 Aug 2020)

  Changed paths:
    M pyjailhouse/config_parser.py
    M tools/jailhouse-config-check

  Log Message:
  -----------
  pyjailhouse: config_parser: consolidate header parsing

This also enables probing for a configuration type.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/42b1f5a55e4e...f02a43a5fb3c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/42b1f5-f02a43%40github.com.
