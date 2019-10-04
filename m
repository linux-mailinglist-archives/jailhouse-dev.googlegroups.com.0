Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTXD3PWAKGQE5INSABQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id C7423CB4DD
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 09:16:31 +0200 (CEST)
Received: by mail-io1-xd3a.google.com with SMTP id x13sf10323418ioa.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 00:16:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570173390; cv=pass;
        d=google.com; s=arc-20160816;
        b=hHTVsMRVXE8QTJsVmQjlEVG49b9jZNYP4SYR3K6zwv+V2i6zAP9SbtoOvPdZ/OD2QX
         c4NLy6NMtBoH4KbyE/g11Sre4Ym6DK0WxE3Ay9pcgPij295fTrelTdSfcT7SjEbddHLc
         YfywjZ9SRtFmjbcxOZy+JEG5gM8dSYQQkAS5xbQiAR6EienP2aI6jqsmNXRkC7AYwlsI
         /oM+5EKAxG+zoDwV4CuZ1NaHAFssqb1q20FagjjEsJNG3WPNffkouQG79/hDqzVEYIOr
         jKcIzOTzCUvuX+vUzeJba1zMX86DSAlgPKCAxtWcq/mA9up0Dv22vz8uNfWd1yjObUFW
         f16Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=tX42q1pesBrco8UyggTSSYkJFdR3Bl3zcEDmhXnGyXg=;
        b=QDLC52n4LgHj0CfPkM1p5d6GuizKlf564gb6KPKtbm2X7kgaEDkmLHsC2n5ew8YIpN
         McRannppxFqTMZC7XMG5222+4plQUaJdMC3HbYH2wmetqi/pe8FSjpHyj9mh0CxYfzjm
         F1i6p7ojJFfxKfR3ZtfWAosN2xi5KvRukXsXa22wy1LUyhmDsYNFhABErSg6MJdQ2Fin
         XSIGufCsKX644UHwNj3SjanifA9sT13x44hSymvlTfouLwyFuCuDjyTXHH2Lz9imEKLR
         ejO6Zf9Ror/9ezzWl56uzdqGEbVGSuhMSKnmMzhTp5LwXsrPtEsRYZsEEasoUpijvSBP
         YLYQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=h+sLFTWM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tX42q1pesBrco8UyggTSSYkJFdR3Bl3zcEDmhXnGyXg=;
        b=NvWby9ECyvT3egy06KInkiI7ly6vKdm1As1OK5qC0I5IQa9lNxAMSFJR+5SWP0dWM9
         ZmUTmBy4Hc5p0ho/ao9fhlPfOXdk+fgOAi3iFy+GU7pynV7a3QKCj2MNLWSCsyRYLPUq
         h6FaTZyy+N7GX+rIWWpcICQTNDaMMF9I6UtU8L5CHc8EHWxtcadbg7GNwGndKAE4QxfH
         cN0BP0CkvZSFE6C2aVGoGbSjkn/QHGaBPBIvJ/iX4rl7W+3QKleUOIbWGasYIpG6/mxj
         IpIOpKmSmJCS72ltM95PNwh+8D79Rwv/80W2/LKBGGmx3kmd0Qu+yB/TFAd2Zzbh2xbd
         b6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tX42q1pesBrco8UyggTSSYkJFdR3Bl3zcEDmhXnGyXg=;
        b=r9vtW6RRzroYZp+FpYgI43s+uKed25oU3BHK5Vkc+jasArkj2JIlQ0Lz2n2x8Qqcu6
         cmECJq+8dMSxA+L5/TYXaJza2RnPOK+cboHDDDwEd/UNvDC56AIO6CiYSyxf9oAIE2un
         19P5/ypeEz/EIAkCFmczfPE0PglQ/4xasjnwU8b8X58hpCXis0QCNNqSlZNIBsAJJpQg
         8Qk1Z116Ea5N3Db6q2sUXtZ2YfstHkmr4rbVs3rzmUfv3fSz4ze0Hox9sXGkziHgNN+z
         TZosJk9bLUfx6S9wgW21wvnPdYE/xCq6KAaZzErr7Up9PlMDSGL5eUblrc199A0ELvkq
         KcAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUnzOnP4r+WhNLgqBRmK2yn248p5uK+0f5QFeSZkkiAHfyhvlh
	TJhi5mtbZbuvJDZ0lfg/s8g=
X-Google-Smtp-Source: APXvYqyVO8nju40tspBdlMMIQHeiORfxSjEOuf6zfKtIvAnMacRpnxC5YdRrilv3T9Pbio27e221Rw==
X-Received: by 2002:a6b:3bc5:: with SMTP id i188mr12383880ioa.113.1570173390535;
        Fri, 04 Oct 2019 00:16:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:c90f:: with SMTP id t15ls2202073ilp.0.gmail; Fri, 04 Oct
 2019 00:16:29 -0700 (PDT)
X-Received: by 2002:a92:351c:: with SMTP id c28mr14737890ila.112.1570173389297;
        Fri, 04 Oct 2019 00:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570173389; cv=none;
        d=google.com; s=arc-20160816;
        b=cZzJRAVUxOxfzrNYFgrCNoF+k/iXFTqOdZAHVf6AlU1RwlRW6xR8vyTb29IB/vz5ke
         Nt7VzwTCJ4rpdVXZKymcU/IdqoMpF1+xU2ZwzJG/NG1B8YyXUGkP+GdgmiZzDVia1pm5
         RQI3HWlRd8DgIB6QVlYJu4ELIXQ5MnXIhblz5Pm2IOWS1DlJi9N8lJLi4fTV3ou/YjZ1
         /Qkjhr6gnfItpV9f8zv+RyQco2VWngd6YW6YJaiDUShC5bY4tX16JAkXIoXp2YDKcW6x
         f/R8h4mnQxra4rKvVutL9weTxMD3glBfzL4QAnCWzt4LTxrc9mL/0pX6DiwBLiZ6fB4q
         R/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=zMogKUnWnVsziKhJQKP/BDAPX8N1gOwLlSNnLb1YN1g=;
        b=cU3uNIFnAROHsYOfy/1rqN3Fikq3I9/W305FT6VbAe/dNlGJpVbvHa5cEu6mFzDokQ
         PL0/03kkKi5k8v1Uue8/gLrUJCPD3UAX6w+cc54yCv4SHYuPiW7tOD9TOfB6WkLYUzXx
         HVgQStMspsO4E8cN5l0W5uqKVFPY3PKWYWztTKph/Lz7OGxFYPHlZ3YhCT5JV28lji9J
         F57L6XrWITu7oOys6MfS01yJh64v33OCNmdQ+xASetkaRR9+6qwbqQrlJ9Ay7DzXuKYQ
         vj/MRBu0eg50+E9Pc1Wc2EnSx2pHnu48bM2/33VpgUSrEQNzPuw0SFP3Oa0bUs1IlDu7
         KRoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=h+sLFTWM;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id i8si283356ilq.4.2019.10.04.00.16.29
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 00:16:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Fri, 04 Oct 2019 00:16:28 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/edfe64-d1ec5f@github.com>
Subject: [siemens/jailhouse] d1ec5f: x86: apic: Add full support for IPI
 shorthands
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=h+sLFTWM;       spf=pass
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
  Commit: d1ec5f7242c0b2b72a4221b0fe281c402298ce66
      https://github.com/siemens/jailhouse/commit/d1ec5f7242c0b2b72a4221b0fe281c402298ce66
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-04 (Fri, 04 Oct 2019)

  Changed paths:
    M hypervisor/arch/x86/apic.c

  Log Message:
  -----------
  x86: apic: Add full support for IPI shorthands

Adding this enables support for Linux kernel 5.4 which starts to use the
shorthands. And it actually simplifies things as we can drop the
shorthand validation and fold apic_valid_ipi_mode into its caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/edfe64-d1ec5f%40github.com.
