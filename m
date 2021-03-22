Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBYV54SBAMGQEWJ5C37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71734528B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 23:49:07 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id u26sf777491ybd.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 15:49:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616453346; cv=pass;
        d=google.com; s=arc-20160816;
        b=J5qII8ePm8CfcDKCG2fqqdr9Aqhej6Y953brstiAVjc+kPMKcWnJP3xUGdn/UkpAzP
         6dPKR+Ux+airRf1p1kt3d5S19tr06TLFhLr4UKvKjLaV67wKhTYxsX6uCBYgFzpy1Wau
         anXcC90t87SrsQBHtx+fJAVZ4GZwv8JrZYO5xFUOVVfVTXxe9mZRwa1JWvU9mNgD98gY
         Ru/QpWxfpTiZkRHT5WxMB/k2bsXD4poyU9ZuukTeCSYfwSCm/oTP7OxZ8aYP3WZIHqBV
         AM5yVdSTtWnYdZMbuiaS9lYOtTCHW719TIKsohY45w2eOnmslCVPMWz72Fw3c5oKtn01
         RL6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=wRzCoG/YY9jhgH/2JD+7ANZENcR4nyq4+5MQwS/mhTE=;
        b=wHHdvAqzS54pG55niJXgUOyaWiiqo/CVqQxjx9/ytFLG8HG5p6AxuPZ434IkDkMWjt
         t/+ElY+LQt84U7QfJ5WHfUZsbRF+oB14TWmslmaxJ1rgTcxJm4XudjW2F+OGoeZ0hXzf
         g/0FWG0t01QnWrs2o5cJT/0ISnaxv45lfzlNOqkr5BQm7Dr4dIlZr3hI0lF72V9eG48v
         QYi+gxv4DmxVQzbPkQiEyZH246oPuS+6dLocBbVwQLiqRCSC4fpvoraaS1nsuQmDeiF0
         PdtDfBBk63/jD+bFHZ/YFpRyQ1VbcC8xVA36a7yEi3+qttrMh84e0TRNUBhu6JqZTrX1
         kNuw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=VtUDw1Th;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=wRzCoG/YY9jhgH/2JD+7ANZENcR4nyq4+5MQwS/mhTE=;
        b=PKmHPvcKwMUm8NoI5PwXX1Z5HHdUUn4uWBGRwdX2GKLoFN7YXMW4JIGe25CBSPQyaS
         ClBekw/i56s19BJyZdjpyaRIl2v0s6oGrIZWwi94ehahtfJlnm5P/nbQDmpADORaeV+g
         30nwUDtmU+G7JEjWPUcYtDCYuf6Hvfog+UTCzwQZVd3ZDVl7bln+wLr3hfWnsA2TD6Ki
         bdiGc74PsXbwj6Dpc+VP9iyfI3/e6dSUS6mNZwYuCd1ySbCAgIvr6oF2sFOjnu14rQUb
         WIuX8KrGQke/Rq9dyMW3UzGwEYfIjNnoKzSOyYfYqeK+OCSbzS/2V6FK3vG75OfqlSJg
         6WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=wRzCoG/YY9jhgH/2JD+7ANZENcR4nyq4+5MQwS/mhTE=;
        b=mubXtxx8iPKn4hOTpumyNY+TmhmhDnGw3Djj1MeuQ38EVny0H+KoAiWuvFWJJyMDf2
         0eurehAKrbsKO6pGZ3UmcJY9id6gNeY9AokHwwweSB5WWBjzDdA/5/f5oXVnyiozb4Hj
         jcvlPKyvgXGYx2rtIRufmvqkoPeN4I6b/uE5vWl+CjaCMyehJZjo8Gvxj00JwilcIeal
         n208j9UbxmmpBcSm8kTfPblO+ZSUCSHGy7gMzeBWTdzBZ4Gwu9rcWPumejPobWSZCosJ
         wjSEv0GYwx0AgW5BoWftj0FER0bdfK5D9pnXWfjmcoubE4Jc9SNrD/6rT7VYRzu/E0xV
         t1Vg==
X-Gm-Message-State: AOAM531aUSyg+3Sdk8Fk9oe9BFdLCMRrcmxXmJHx577Ft4Vv7kstaV5x
	19SdSUprOdsQ389vhjur1Ng=
X-Google-Smtp-Source: ABdhPJxBLy9K3L/rlyR+stzNmq7OQgif1OHLa7WtrsHfTR1auBTCKyhSqWTppLqq4XjrErxL62YCdg==
X-Received: by 2002:a25:5888:: with SMTP id m130mr1131321ybb.415.1616453346652;
        Mon, 22 Mar 2021 15:49:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:1ed7:: with SMTP id e206ls5091414ybe.7.gmail; Mon, 22
 Mar 2021 15:49:06 -0700 (PDT)
X-Received: by 2002:a05:6902:102c:: with SMTP id x12mr1115559ybt.421.1616453346159;
        Mon, 22 Mar 2021 15:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616453346; cv=none;
        d=google.com; s=arc-20160816;
        b=GLu0yB3BSN7VLCkfIp7FNvV50tTZT54EYIsyEg9JSJVB3tQg+rBGMxxCaNHKYMoqpA
         Q5cH+6mlIw9xaYdMbFMYkm/kCMc/40izIesn/LuZdayn0rNXCZtNe6fL+w0BUY5DTw9N
         9HbFa08NF/D7tuT2YSjRwifsWnaMrS6Y0GyQqZxlj0vi7qB7Z253JmgVUe39tDVuSEAP
         Sy//gbwUxIoSR8gEpA3S/likR8bA4G3R/TrbRdtd2r+++i5tsBJKgtV0msqp1GiIu7Uc
         pSVerRMGQiS+vjEs9Uu3Os4WaB5AjhJUNOWcExfV6Dc0TXxGnEO5gOg9JS2Q8lEcOKRo
         KTXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=M1ivA5eUcTKq4477j5+rNPWs0ReR5h/ZLT//sZxcUrM=;
        b=U++B9ahPeeDYt9dGudqtzJqUiIZlYdqVgoM+YjhJHnV+45bBHKXMP8pL33lSiVUj8/
         TRJCxtEcsDGaC2MT0lJ6Yr1XHWOrAIME69Q1HfQxO+aQTmBpG15t1nK5/xCi27PLeXwd
         9CG5Ai0PKkyciWT7qsjZPeQvp0nBrBsZDsX8FksGXN5a9l9byy7TxpZvG+XojuSvkmhE
         HmCXDCBPbELHTXiB+vsOvpJCP9HwhFAw8oNtLpN4aP3fe7oVT92OJqyvqVG74daZRO5p
         NxMzZOAIwyAYf8xTosQ+y2BWzFLaC33GTZs7pZ6wKw9ISlWuhKELYq8RLyCCjuzncsNl
         c20g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=VtUDw1Th;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id x7si790940ybm.0.2021.03.22.15.49.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 15:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-dba308b.va3-iad.github.net [10.48.122.47])
	by smtp.github.com (Postfix) with ESMTPA id E58F23406AE
	for <jailhouse-dev@googlegroups.com>; Mon, 22 Mar 2021 15:49:05 -0700 (PDT)
Date: Mon, 22 Mar 2021 15:49:05 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ee0e5c-ecd3cf@github.com>
Subject: [siemens/jailhouse] 623476: configs: arm64: rpi4: Move RAM
 reservation down by...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=VtUDw1Th;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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
  Commit: 6234762737513985d5de14d860773ca3257f858c
      https://github.com/siemens/jailhouse/commit/6234762737513985d5de14d860773ca3257f858c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-rpi4.dts
    M configs/arm64/rpi4-inmate-demo.c
    M configs/arm64/rpi4-linux-demo.c
    M configs/arm64/rpi4.c

  Log Message:
  -----------
  configs: arm64: rpi4: Move RAM reservation down by 256 MB

This is needed in order to switch to upstream 5.10 kernel. It refuses to
reserve the formerly used region, apparently due to conflicts with
pre-existing reservations.

Beside adjusting the cell configs, we also need to update the inmate DT
because it now has an overlap with the physical inmate RAM.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9850d614a2fd97c902dadef4d20217e17ace24dc
      https://github.com/siemens/jailhouse/commit/9850d614a2fd97c902dadef4d20217e17ace24dc
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/ls1028a-rdb-inmate-demo.c
    A configs/arm64/ls1028a-rdb-linux-demo.c
    A configs/arm64/ls1028a-rdb.c

  Log Message:
  -----------
  configs: arm64: Add support for NXP LS1028ARDB platform

Add root cell, inmate cell and Linux demo cell configuration files for NXP
LS1028ARDB platform.

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d8076d8bce49842558cad154b43f6f5c59192bc4
      https://github.com/siemens/jailhouse/commit/d8076d8bce49842558cad154b43f6f5c59192bc4
  Author: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1028a-rdb.dts

  Log Message:
  -----------
  configs: arm64: Add Linux inmate DTS demo for NXP LS1028ARDB platform

Add device tree demo for Linux inmate running on NXP LS1028ARDB platform

Signed-off-by: Anda-Alexandra Dorneanu <anda-alexandra.dorneanu@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ecd3cf0ae00e3dc3e122b730f53752180df9393b
      https://github.com/siemens/jailhouse/commit/ecd3cf0ae00e3dc3e122b730f53752180df9393b
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2021-03-22 (Mon, 22 Mar 2021)

  Changed paths:
    M configs/arm64/dts/inmate-imx8mm-evk.dts
    M configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    M configs/arm64/dts/inmate-imx8mp-evk.dts
    M configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  arm64: dts: imx8m: add pmu node

Adding pmu node supports to use perf tool to monitor the CPU performance
of the inmate cell when enabling Jailhouse and running dual Linux OS.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ee0e5c42c9ba...ecd3cf0ae00e

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ee0e5c-ecd3cf%40github.com.
