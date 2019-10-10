Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBD4M7TWAKGQEVNIM4UI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 63866D270C
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 12:21:04 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id r187sf2921849wme.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570702864; cv=pass;
        d=google.com; s=arc-20160816;
        b=qBmrm7BPmo/mPNsUKYX7FoDFd0XoKkZrm/2+W8oImmgEl4xoUdOsJfquI7DAIJML0H
         G8E6569o7h3HuhceSCduS/G0BIhfTq6gUCdHf3EjYpk4+ZhZp3lv/hJvU1DdkiSbtT4r
         XUo2Fpapiz4C2v/NlIE4mssO09D2XinvXTD7mZpecoHr8jrmDaUMRg17apU2Ab34RSK4
         z4hGQCtbtomomo0Yi2Z1kLD2V1haijahwE1PBxD0f/mKcdOZHEYiMxV51lekmsXXNS6Q
         zVXcrWurAYBmesM813bjHVFJ6wxq/4e4pdifW66m3VdQ7yrXqtc+iRd/zpx1oNfIy5bP
         rnyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=fflno4u2Cy48rGTFrgeexzub/Dd5K3DQljAa/qbUMeI=;
        b=jlLVHgBZ/Gqj99Lti+UJincoVMcGus6RmmMigXlx/08FnGGMhhUMH+ADgGHSNDX4LK
         XGtPaJ+KnJEcH3zsCdIguLGbMgeQaetj4GGVhTx1UmLdvk6nQ/4qSZ0hfSnT4iejrvpY
         zQA+2rRNTyTSb2vExUy6K/N3I2NgCLHLeQNqY7iVOLMceRTcmjB2ALsVp6ToM8FWamLp
         xWa60lJhvj9gT5lVqVn/fF71SQtnagey+DX0Pu6P/v8hBOI/XetMqQe1uWFCPFmQn++a
         Oeq42r9QdbFkOXnU22JXOa754PfBbVlAwdfv3qAgPz6jPvXGcAglzWSzW7whWswCfSjd
         DSpA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fflno4u2Cy48rGTFrgeexzub/Dd5K3DQljAa/qbUMeI=;
        b=IuSSlpwaIUz9/tKRZ3WdPU3RiuRa5HJYtYfVNUvqu92K9bkr6i5coY7v90NvDWR7Eo
         O3aCJKoGx2SfnwXL2h0+rizSeeiwOUfixc39V4ni+y8SdbhK30wVaqJt5zecM+f2j8PW
         iVPqOQEnYFLqjoYlLiX/7xFrjnVFLAup6G5q3V8qHzzBlgLeDQNG7KxvJH9cpcMD3SHD
         E1AuuTfYagGBnH4vzRAbQUCmRbFhidIKiPRAS/IoHLDdmWx/xdZ8JTCefkw6ij4AQ2NT
         i+CIstb1zxR1VNAnMD7waNtkivaMzeIsZ4jGVRj0TlnsCfk/+0zC9il0aDX8aEGFwd/F
         GS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fflno4u2Cy48rGTFrgeexzub/Dd5K3DQljAa/qbUMeI=;
        b=UxN0YUySuEaPRTI3veWUBcxfThySJ2/88rhZneTK4Mc42+qI6iYrObx1KcTmW5Mv2t
         aE3Gmrel+ezhYw3kWCH+VA6xkqIU0LdIvYQdVNIVlmfsLBJ5m0Sdp4T68PEjvP0+I8jL
         kwiuS+BurvnilDmO5uNlk2Df7Ympg15iIDO8Mj/sifGlhVqHCGW7RGQTK8hlTJjAMkzt
         FAlF510UER22qpMSYRbN6bTOuNzsZYq+3ZW6YLQA52pc4BL7JI5HFHl2SX0IE3O1jpAW
         MqPzl3NFC8n9iqxjdqYeiwtfSrRkYrYhdfEJkB98gewsJFR9oQuSUBFmuJVYposOxU2F
         rnJQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUzRR/wH5yCcBeAI2eYOMf+p9kp4LOKlrXdTeuLful30Vj38XlK
	3Jmghu3xmRdVL6vPeWeKMuU=
X-Google-Smtp-Source: APXvYqzDGBf03UEtzf1FdAbweQIsv3wfthWYkZIap5KcUJYcmwUflhYLdhEbL2BKQ6fSoVdbdoGR0A==
X-Received: by 2002:a1c:f00a:: with SMTP id a10mr7313829wmb.89.1570702864064;
        Thu, 10 Oct 2019 03:21:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6889:: with SMTP id h9ls1144352wru.13.gmail; Thu, 10 Oct
 2019 03:21:03 -0700 (PDT)
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr8356564wrq.287.1570702863251;
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570702863; cv=none;
        d=google.com; s=arc-20160816;
        b=aFx8UGRZZWVLU/utg7kNMwtKpmNAkR3GXhwY7bPg6ANvvC5xyRbU7A1NopE6fCxonk
         +ev8t3uVK3cmpZ3R6nIxCgvGjOvIDS8xMSqyuWYK/jEA2146Fp8Ktv+cYqLHBT6tvnl/
         O/WUJGdolCWUL9dznPkH1xORM8gsyuNrudZQiAQuMyF2j7mv3LU+Kcwh6Xsak72hDAqD
         J8aEkrTvQ8iPotIAueMGJrdTCBKQ6V5Rv/yrKI2KtCR9ox8Nkw20FjN2vEygEVnpdGdx
         qaRchEk615F2CtOvLsuimDPk1QmwwzW0IS3+e6yfXuwyinl2eDVA2XXqAdXRmUBpf8da
         A9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=PCB4xCKNTmVQFuWvLC6ggpsoldRF107G4seWslbZ1qE=;
        b=PMPcBfq+5kPJ65gVUh/eIQPpJl8vQ9J9Y0m5xpeeX8XQSFipXavmYRmOzJQLlKKWx4
         aHj2NDVaP2Qiq0EbsM6FM9x/b3abJlmL+CcujMLcNnO44rOVrYNuL1wOu4tL1v6k/jfK
         Rj3moQlcvJWEKKsc2kvNFq2+WsP8h7QYDwdIzDJQDWD9lLenO0SmOaAGXotXqmXolNbu
         0rQ2JThZ7tiO8ZLHhV3bHyF7oorUBEFGX3iuRf+Vn9VbW3Lsq6wtI066j5hiGEVeh3oy
         c3hE7QRVDsYIdqoOzdynSfIoD/W3HxzQrCs0wY22i5o4s1heHGfwG5W+7f+lUReK2Ljw
         rcLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p5si228266wmg.0.2019.10.10.03.21.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Oct 2019 03:21:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 46pnDG5M8TzyD1;
	Thu, 10 Oct 2019 12:21:02 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	jailhouse-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 0/2] x86/jailhouse: improve probing of platform UARTs
Date: Thu, 10 Oct 2019 12:21:00 +0200
Message-Id: <20191010102102.421035-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.10.10.101216, AntiVirus-Engine: 5.65.0, AntiVirus-Data: 2019.10.10.5650000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, URI_ENDS_IN_HTML 0, URI_WITH_PATH_ONLY 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CTE 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_RCPTS_TO_X5 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NS , __URI_WITH_PATH 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

probing of platform UARTs is a problem for x86 Jailhouse non-root
cells: Linux doesn't know which UARTs belong to the cell and will probe
for all platform UARTs. This crashes the guest if access isn't
permitted. Current workarounds (tuning via 8250.nr_uarts) are hacky and
limited.

Jailhouse now comes with flags inside setup_data that indicate
availability of UARTs, so simply use it.

  Ralf

since v5:
  - Link: https://lore.kernel.org/r/20191007123819.161432-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07568.html
  - Address Borislav's comments:
    - Improve commit messages
    - 1/2: Use min_t instead of min
    - 2/2: Add __init attribute to jailhouse_serial_workaround 
    - 2/2: Remove __initdata from setup_data, as it it is used by
      jailhouse_serial_fixup(), which can not become __init. It is
      passed over to serial8250_set_isa_configurator and can be used
      after bootup.

since v4:
  - Link: https://lore.kernel.org/r/20190909151030.152012-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07483.html
  - rebase and test on latest master and resolve conflicts
  - Add linux-kernel ML

since v3:
  - Link: https://lore.kernel.org/r/20190819183408.988013-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07365.html
  - Address Thomas' comments (and it really looks nicer)
  - Address Jan's comment on patch 1 and add his Reviewed-by tag

since v2:
  - Link: https://lore.kernel.org/r/20190812110650.631305-1-ralf.ramsauer@oth-regensburg.de
          alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07334.html
  - avoid imbalances of early_memremap and early_memunmap

since v1:
  - Link: https://lore.kernel.org/r/20190802123333.4008-1-ralf.ramsauer@oth-regensburg.de
  -       alt: https://www.mail-archive.com/jailhouse-dev@googlegroups.com/msg07283.html
  - setup data version check wasn't really prepared for extensions of
    the structure. Add a patch that improves the checks.

Ralf Ramsauer (2):
  x86/jailhouse: improve setup data version comparison
  x86/jailhouse: Only enable platform UARTs if available

 arch/x86/include/uapi/asm/bootparam.h |  25 +++--
 arch/x86/kernel/jailhouse.c           | 136 ++++++++++++++++++++------
 2 files changed, 120 insertions(+), 41 deletions(-)

-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191010102102.421035-1-ralf.ramsauer%40oth-regensburg.de.
