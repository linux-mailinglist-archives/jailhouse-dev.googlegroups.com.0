Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHUASTUAKGQEJNLMZ2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id A02554706D
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 16:26:40 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id x18sf2635419otp.9
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Jun 2019 07:26:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560608799; cv=pass;
        d=google.com; s=arc-20160816;
        b=iB5JxilmpiMj9Ug7JknKEqjLJyqOaBP1r+grEbQzXXDqJLEMJWHc5LYulEgq7BkQOk
         44MBdGh3TforCdCkSLAcoLBTTpwL4+ys1G0mYDir3z0gI+AARwpSiDppO3JtvOM/vAJa
         FtaslB2ETT24MBGOdI0lGPMvGQ0vM4LtzfEJFBTEzq2IGGti7YsYiFPS9dFIIkzZVkM6
         CkY2Y7ho6sjkrUxPB35TX+d/8cisN/IOkjkY2y0Yi1QxGznE0bzmyLULIrdQC3oFttdP
         hQdaisf3pwHAq2zlqnrA1T/cKMYMcwQJxj1fpYxitaAoA2714xFOw1EM+F5xRruzFaBU
         MCgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=T2bdIij/YkGbJsGWHq7J5U9imPd0hfjbavF46lzU0I8=;
        b=QH9TiDXvhj4m6LEBY46SqG1zznt15CCjCLjpyVq2rKTfL8j+rzT6YUC3Sjyk9WnUUS
         vrdBRnH7Az721IQjHp2Kk0MYqVMcdxS2bUVQ4S006UBxxazGPLHlFLKKbwD8gFEasj+G
         +5cUxeQVJDmFxrtHvU4f9SwFOiYLl8Ev06EyqiCfj3Fb7bKoG/VyMOoaEAnl7R4wN3O5
         tEDC7BPfK1hto7Y7LIaP2Bp7VkaDfbHJTwM/4WsvCS+zbOeQZWNbmpARi1CgjXU3dKSA
         JIavpCktd8xXBHtk/P+oNIhKYJqbTEXzAOjCBwHXY41dPHfc8f84eCvfRM1I8O+u+1A5
         zVrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pDTAK677;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T2bdIij/YkGbJsGWHq7J5U9imPd0hfjbavF46lzU0I8=;
        b=lz16tmIGMBMiGobKO1maiyJjl2UoGgD9zL7confV1kh39GS0MAT7RNkCIokJmMytxR
         ciWbhkYgEo+pTLmmhv4QcY3AINVZ3YFdtFsfUkjIxEhpQcHUrIwmm1zqdpYJZ4O2GgO7
         OijaxdAJnF7o7vXMOOtRL9DowcmfFeElX1caBfy7GSeUvEKOG/yL5uwJw9iGW1ggZE3v
         /frGftAqfDnMqt1Z6c4e3M43XOGPg7qilR5t+snivjc84RO2jaR3AsNBqfyKP5SEQRe5
         z5KozdrBo4lgHl4rwtOyIw+JICKfLbB6jIQB8LUNN30WxDRzVIUSArVIK9VRaRNUiVqM
         ZVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=T2bdIij/YkGbJsGWHq7J5U9imPd0hfjbavF46lzU0I8=;
        b=NEdk/Rk8UMdq6B5Ys3kpcTTLqB6CGnv6YsCYSkbjXhrZKHMXCZbHeWQ53/odfzB/L4
         bsJs0fg+oaYh4kIPS+HWWtpz2wzKbm4Hql4eICXm/UJIBuZjw2zJRddBDH5EFWo9dhCl
         DgUiM9yHlN0HmXU0nhet73ftuK9XDFaR2qVoIxjyWNrMLm5Hq9y+gU0AP4og2eM/oN9S
         KJd3nPaLBb2fucF0XSoxYpl754OTnvZYcNxJFyNLhZbHgd1nehb7WCIzv+dEsSqIyQcB
         Wjike8XBjIihvEYG0/lXXSIyaTYi6N+OuI4W28/TiJKkRwsb/D3GF5epHG7aG1Qd8evI
         AEMQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVB2/2JHxccB7ogQCn9ERgLUt6LvfWXBhfBO14eUmkJ1i6H4wKA
	Omf8h/L4O1CArCgxP1i1Z1Y=
X-Google-Smtp-Source: APXvYqxZMskAHhhwNvJ483rzPzysGglObMxvBG7DHEGfjT5uyNEfiDltYYtEQRbCL0g60+ddXAbm3g==
X-Received: by 2002:aca:80f:: with SMTP id 15mr5081464oii.118.1560608799100;
        Sat, 15 Jun 2019 07:26:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:b642:: with SMTP id g63ls1678749oif.8.gmail; Sat, 15 Jun
 2019 07:26:38 -0700 (PDT)
X-Received: by 2002:aca:39c6:: with SMTP id g189mr5278675oia.65.1560608798625;
        Sat, 15 Jun 2019 07:26:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560608798; cv=none;
        d=google.com; s=arc-20160816;
        b=CME7x7EQdzuSMLJp2jxbk1/P3psSH4+1Q8BdFfkrd9C/ZUnzr7KVeyd3VJtirEKDWx
         8ghEqWL7GbezXuPakQ3cK1ByiKmxMLUZEdSEkQcAxK4ENdoi+Ih33b35Byzn01pnvxw7
         KuL+ELwUqiox0jmI007ja+X75Bn8I3J6MC4DJG3BipmPFCPFfuLF6t2sjTjG8XLxZTE8
         EsoM+iAU43xRwnnpL4K1USvfZ60ZxAOrH//Jmb2z+MUPhd+xYHw3QefdG2WQTfLdFelG
         1hAQqyawqr1dChJBcc28rxuBDSaW2FwzhBQ9aQ8u1N4jv8sIR43NX352e89UV5EifZiU
         7FEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=CVaOJ89NuUAQ1VlE75Ltu3G7GptRG7re2TS6DylEmnc=;
        b=MlSZ+QCamhl1ZFbGHQR6AtQJzSuTiXYInC1ZG4GlZ0W6TDFxcXD4POZvLs/wAJajYI
         9N2E6CRcVuMtmz/TgmqJRyjAUT6ihg/162/ra1ljwewqO+y2/A2Ib2nqgFsfY8UPCQ81
         FiYBGkcbdwBgvLJrCdhT8njk8fhF/yOW7LMejkfD6nSMcmoa6IdZ0Cs1mtYDk0tbGYHd
         EHQEJzahJ/VRbZBSnt0LD1GcVfLp6e25+Jdg1CQ2lIHQ9iXOeHKsfKQAS0uItnIgvEtl
         Lvnbk8gGaLrHZXz5JQHCGGoITEaHDXnaX78pBBo7HUS8H3SAf6hujim3J5u6P7fubIrM
         6Img==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pDTAK677;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id i20si34500otf.0.2019.06.15.07.26.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Jun 2019 07:26:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Sat, 15 Jun 2019 07:26:38 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6d5d8b-77c96d@github.com>
Subject: [siemens/jailhouse] ba6ec9: inmates: Add missing FORCE dependencies
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=pDTAK677;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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
  Commit: ba6ec9bf9837ac2bdf31f09d2abce53dd8b0af82
      https://github.com/siemens/jailhouse/commit/ba6ec9bf9837ac2bdf31f09d2abce53dd8b0af82
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-15 (Sat, 15 Jun 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/tests/x86/Makefile

  Log Message:
  -----------
  inmates: Add missing FORCE dependencies

These rules require unconditional evaluation to ensure rebuilds when
only variables change. Adding this reveals that we missing 32-bit
objects in targets so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 77c96d4cd6023c6b6350db22d159063574d5c5ae
      https://github.com/siemens/jailhouse/commit/77c96d4cd6023c6b6350db22d159063574d5c5ae
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-15 (Sat, 15 Jun 2019)

  Changed paths:
    M scripts/gen_pci_defs.sh

  Log Message:
  -----------
  scripts: fix comment

The file was moved during integration. Align the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6d5d8ba6933b...77c96d4cd602

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6d5d8b-77c96d%40github.com.
For more options, visit https://groups.google.com/d/optout.
