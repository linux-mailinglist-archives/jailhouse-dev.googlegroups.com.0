Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBUVV2HTAKGQE3XNY5UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id DD24118E77
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 18:52:34 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id x1sf2404842wrd.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 09:52:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557420754; cv=pass;
        d=google.com; s=arc-20160816;
        b=kw16ntnecC0W5BN94zy/mIjT5bOFmDg9iKMWS1nV3mJraEbWbLK0xVOp5K7+/xT06C
         bYTRLOWPH+e6GHlzO4lEowIMykSaf39w7m/TndGlo4acF3BPK3ekvJ2Tjn1ahysSrxSl
         C2XUOT7Mv1m6WBkgaPVuI8wr4RDlbCK4RkHfPY4JNtJBEfsBX7GucI2sVNMI3zudMHsW
         Xe3DvvvE1lTbHauZ6FwKmDnjo6RcrpM/jDhQagATHMvM/SPlEncUmCnJHpWHlTgf5jfD
         O8NHP9jXf3Yfarr3aV0ifMguUuOKl7to2uK0X7IutHcos37wVMNnfE8ozgCb0IkzH8+1
         s+8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=WizvW2Ah2F7BOymg7nDKLEstbma5ebYmvPp9cCtM2Eg=;
        b=Tt+nK+BO84s4Pq30rXvFY3ZYJ3PLv2Nl3Xn3efeP+8Oza//FRXvjXsDxvXlK2NPiNb
         yu6W7LRVBDHC0ENg9vSKBwUa9Sgn3+eS3wR3Ng8ccRHPfx3aHA9qlDF1u9bU09Twwx5k
         GvV10ytgU/+ps9QWGGlly1MZOjrxi8ZPFghmRnijEQxispEli2RSBrDj2I5cc/tH1qAj
         M3uHZerCPaUD6DTGILfzTfl0y+9Bbv908qnUwRC9smkK38zIrK4ztWdyN69hL38RUb0D
         D1qDEHSqpI8DrpI8Wbld9lE2OR+rAXvC3jY5B5+8iv7U0W3qFC8aubta9GLlHZI5pX1N
         TCjw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WizvW2Ah2F7BOymg7nDKLEstbma5ebYmvPp9cCtM2Eg=;
        b=iWxZT4ak+qSOGaRumNDJ0Wqb7OofB1Kj8hAMSZH72yJ00/YbOG1G44bVKNlHfL+CzF
         aMbj3jMvDuba0qtQrVPOxYt3PWY0ZIHqVCvYM1zB5qiKc7pxmyZ54i7QxJrEKlo+SJ25
         cJZ9c6BxmmjX3jOtdquDqvpGLwmbWP/4vH5NJ0Z9ChF+DwLWexdL4xBPtUoJSoSUX0wc
         QzBi30cWCpziXKfyF3m5Fmn4TPMDogzf0Gc41bQ6IlfTz+IFKbuqwjjmHhimHEJyCI68
         VfQnuGjdm016J4JOzy4EdtsMB7wSK2kGt+ZiygqS4rnV/n9HHHFXPbPtvCILz7hakmQP
         b5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WizvW2Ah2F7BOymg7nDKLEstbma5ebYmvPp9cCtM2Eg=;
        b=jcfvkJeP4rJbGsEWyq9pb7ItiUo+cDX3JAa9KGW4DLpWywitvGtmh51eqAicl58bjC
         N29WYNKwWlxN5XHM6WF5d9niSPTU18gi3tn4ISRkc14L7vNFHjebaspIUDBVPT6dAk/i
         Y1rYnsuvan5JoWhq4ZewwXflV1zxJh/ruoZZ/rBhHuLEgSr9qXRyk7ZhI7TlURiXB8DI
         iavEyHDxH5SDx6g23xHfpz2CyRdLYuSEvs31iXfMFhStfcQCyNLtQeI7Jjw9hs17QVZE
         ckY+6J65156QbWet9iqKQRC9pdGiKHaxRYqtyQRUGuSkkiVQU/3H3W0hymV+gMVXZ5za
         EgUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUpk3qiuOG34RmX/eR6aj0EjTeiATyA8DRCtjmuqXr+0Sl8RPfA
	P+12g7UUXOpozRjLkmkVnZ0=
X-Google-Smtp-Source: APXvYqydpPMSSyZlRnM9xSwVO/RoK9ilLU5lRq6+x7UfJwdJxDF+Bi/ESInN2EIe6fcZagFYs5iDJA==
X-Received: by 2002:a1c:f719:: with SMTP id v25mr3761572wmh.90.1557420754640;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b406:: with SMTP id d6ls832725wmf.2.canary-gmail; Thu,
 09 May 2019 09:52:34 -0700 (PDT)
X-Received: by 2002:a1c:9d0f:: with SMTP id g15mr3791397wme.97.1557420754112;
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557420754; cv=none;
        d=google.com; s=arc-20160816;
        b=vvl4Hnc6yrEBKwOctC26SkS6NH7uVvtvbJT5lKOBADBem8UL0uk90OvJQ8D2kgf7aK
         +n/GWxiQxw4YKtCJrKGhDPZORLpM/6ro0xU7xcFIYC4tPFPNld216NxXo9yDXHloILxE
         4k3JzCv7Ocgbso3M50P8aXRKz3LfqGkW8T0pRmakVr/yNmdJ4SPKJ2lbIo6iuECWsVqi
         nchbYDhbbTRlp6V+QuF1j1V/SOf31gRqLJ3fW3aCM4oAViAaPf1iNoOQfUwam417LeGh
         X+mJ9t5BRvG40cisw/GMIYrANWUaAsHP46uDFaTdqoNCjOL7v9+Ybak2llYncBR6EqXP
         5PMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=SX1bgAVNx0gjJxuPCf93EjhXME9qVETxrxT1B8aLPj0=;
        b=IKpSAowX5d8vA4S0+kDRRZ62CemlC/zuFxpUwS28Azr9d8oqk+znF5MOCciqUDh/+A
         GWTqfkZsZ2agOqtttp+Ly9Kzjo8zzxxBx9CcsSYRWvt1m91nAxUknM7JbChwedIIEze3
         AOKUySyobpOc9ynFiWMv20Y5/vmXiIJ7EbkS/+TYrSn7HRL2omoWUl50BbmzgyzopEjf
         CPhBnyg8kcpU+GnHHctX7N5oQC1c8YP0Mt63mqStsGTJbAT5uUouzAXG1qXKcqk+2pSB
         8gdRVSmEmiVrmoORe1AKJ1rk6hKJGHaGU/lrSOk1baTADFs6cti+9XW53hw6Hs0O23vs
         1yBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id 61si594308wra.0.2019.05.09.09.52.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 09:52:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450KC55Nt7zyBN;
	Thu,  9 May 2019 18:52:33 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 3/6] pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic
Date: Thu,  9 May 2019 18:52:28 +0200
Message-Id: <20190509165231.18572-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509165231.18572-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.164517, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1600_1699 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

Make it easier to read for now and required for upcoming changes.

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 46c95fc2..4bb50605 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -630,18 +630,19 @@ class PCICapability:
                 cap = next
                 f.seek(cap)
                 (id, version_next) = struct.unpack('<HH', f.read(4))
-                next = version_next >> 4
                 if id == 0xffff:
                     break
-                elif id == 0x0010:  # SR-IOV
+                elif (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
+                    print('WARNING: Ignoring unsupported PCI Express '
+                          'Extended Capability ID %x' % id)
+                    continue
+
+                next = version_next >> 4
+                if id == 0x0010:  # SR-IOV
                     len = 64
                     # access side effects still need to be analyzed
                     flags = PCICapability.RD
                 else:
-                    if (id & PCICapability.JAILHOUSE_PCI_EXT_CAP) != 0:
-                        print('WARNING: Ignoring unsupported PCI Express '
-                              'Extended Capability ID %x' % id)
-                        continue
                     # unknown/unhandled cap, mark its existence
                     len = 4
                     flags = PCICapability.RD
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509165231.18572-4-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
