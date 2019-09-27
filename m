Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBSMUXDWAKGQELHKJSZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x540.google.com (mail-pg1-x540.google.com [IPv6:2607:f8b0:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B43C060A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 15:10:35 +0200 (CEST)
Received: by mail-pg1-x540.google.com with SMTP id x31sf3547417pgl.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Sep 2019 06:10:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569589834; cv=pass;
        d=google.com; s=arc-20160816;
        b=rU5b+cyWxM+zFyu6lwR8/PtbUqzC12OaWGmDopde/HdfNyK6Bp8rimT/1co2LhSH1U
         8Jrwg4wtBEBC+DOJWiDZpIJrSXukQWEiwo9fOtvW5HJk0gX94DOMTcSUq05sSmcXopgd
         9gZa8mnsi9Sbl3f1xB3g1p93idJN2/TldJ1WY1ahBDZ/avqS3k1zja33KXWWu0ztBCpB
         HshtyURSKoHsDCXCB75i/Jsj2ukcRHRP2CP3dIK7Xuw7biDqSO9ZhL20J9F2tA/zoZbK
         A12CnPoeGxF9QnlnJCqUsyH25z4IOLQj0GRhf7PYDbrNddEUVgjdJKeEtFl5CTZYb5OY
         NOvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=DHRS24jEE2+6ChPFCqqn2utPyv5sKtBFGZFjb2V2nDM=;
        b=UCMSWI8+GwiTfqrbxnmdMIt8jIvPtulBZCbn+dYwF2uQJGLiCnsc0tj3L/eyim8lXL
         2d8ePyLSwVqHWG0AgtzsMqHD5cjPuQy+ZWWgXuLEkvh+SFc8DZeIrjNdEbVaGWlnhjRc
         AywVsIO+XvShJgrDVBTxSnthvNZDlYoFsel2JgTIkRbILYMiNmLxkTBQmSJR6m0quRr+
         9vNAq8lWoagz5vxOBG7s+lIsTuSHZdqk96DdTijzCH8txdVjsOvOn+wcygcPVerVejsa
         2cPf22IVFH2pnUA+IRURHHNFSXwN6HKfw3BRlnsppMBgGhie/U5Pj1+25JjP9ODiYha6
         l1qQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ucn5MBwy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DHRS24jEE2+6ChPFCqqn2utPyv5sKtBFGZFjb2V2nDM=;
        b=JzgLiH3pqdemIT2dG+bZNG8Ldj2C+n2wwKrj1carGPvyFVfRq8UFYjMOIU4ShRIHsE
         vOcN5lOB9HufHHnS8ezp9gybFd2y1U+0Ap0NP9D2lVPHCptTYyoxN8J0Rr4AYcJZRnfY
         aOnvao03/IyAGL35fZJnQcAjrQHoBD87Wvo+OmLGzxf/RiEOPguGrj89uqrL07dys+mJ
         GUOlDiHLm79/75UYkFeGoAfYBFE2YDidWWPHcDNBDUMs2/BIzW8nCV+HikBv+e7/MmTg
         GbJQB2Cjzx8CT8Sf2OBCmTOg9GloOduv6u7vipFA+v3mmAjeqGQkIuU6T1ivO+MWeeWN
         kvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DHRS24jEE2+6ChPFCqqn2utPyv5sKtBFGZFjb2V2nDM=;
        b=IldQsl2Zwi050GTIWgLTINqTkQ7id+Ko8a+9DfVoqejlio6gJD7KzL+orVOvhkQLep
         vZJnx+VyzT7VXSemlhMi2UxbGuJ/mbUSAy8BbLDw0+NTCIYp8ohLmhv4PtJbHvsp9IPy
         XwIII2yTSyFJa6JD4oU+9cfcP5WrdJCxNm4JDp6Qr/moJdOR0FEwct/d6Z6KAeZ+5wv9
         ina3OVrMPhYeosA3QIZF9OlLXAfCGnMGF5MFvy7bszS9IM+vq3msjAepW+AoZGpTWv62
         WgUDhxmVHFA/efbWhUHnXohAw0TJ9YOyx/M9f9XmwiAlan2sFGsYARalEn4YsVqwH8PJ
         8IkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUrmvX6jDEWCqPXbRLYIKrpDTviPPG7kdxOaXRpji+5uTYlFG6e
	5VuUbiS8BSOZ7Rf953TIo3g=
X-Google-Smtp-Source: APXvYqw0lm4Rt0RkBLCQFibgLKBEiBjbPBrqnwO137C1BdD3SstqBidKf6q2/BFYIyG2CcpUIM3Gfw==
X-Received: by 2002:a63:304:: with SMTP id 4mr9160361pgd.13.1569589833847;
        Fri, 27 Sep 2019 06:10:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4301:: with SMTP id j1ls912791pgq.14.gmail; Fri, 27 Sep
 2019 06:10:33 -0700 (PDT)
X-Received: by 2002:a63:2943:: with SMTP id p64mr8675548pgp.98.1569589833011;
        Fri, 27 Sep 2019 06:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569589833; cv=none;
        d=google.com; s=arc-20160816;
        b=YKuRFQObhjDimbtspb1PDaWhA4D9w53uQEyNKy9ELMTTp6I5hxd0Fg35rItdK8Irmb
         VEKA3FffK6mnJdpDkloAW385pZzYoS/30co40ut59yxpL2IxloLDuVTNBqYIaEjin4jw
         ecMEun41L8Y3UDZh9Cvw+ZQermMmitZrw62/wRAhMdj/HpKCjA+LrXu00U+P4SFksWy7
         qGBnUxh4jlvVWSkTvY092mTxo/k4JKowseE9E+a4sFXj4MQ95haplDwGwrlDGOcUx17J
         V085MOzXSrJOaOLUOZk/7VOyIvgEOSceayoW447MdTGMp6qIwR7C3v7yXGijfDHUGcNE
         /Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=UKLKhJzNHPqw2TLvLWJoyMubBMWJFpAJQTu+RqZ5Mxk=;
        b=K3oDfOZTMEk2+1x4zHNb6O9c+V/QaeMuL5vEyLFnNjoUVU+EpIAfHquUmRGcPXHd1t
         YzVv8yitGR/37R3/d3VoT74acPaRRr+bUf+NwKxBIO0aSX7gRvPTsAXwfkEArKuwLFz6
         nBOTdG+s6NcNkw9OCqE5gPAeKJyWRb7EWeUalkIyTQhvmF3JhsayqIk5AGhICYxGD2Tf
         jRRihiQEquqXXCa1HZM8PpdpuUoaXbawTTGKow1G9YeT1U6670S2x3IdB364W0cbMjeZ
         DrPOTp2yr+OJyK8JN0G8z/wyNGxzFK/NzSgXDMVs/tBsEnIVUtI741JfPmnuGJE9ixH6
         Nmiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ucn5MBwy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id q141si112069pfc.4.2019.09.27.06.10.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 06:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Date: Fri, 27 Sep 2019 06:10:32 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/955a94-7cc0dc@github.com>
Subject: [siemens/jailhouse] de7a25: configs: Fix qemu-x86 /wrt VGA access
 window
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Ucn5MBwy;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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
  Commit: de7a2584ca2c601ac505d45e3b6e1da58ba5d2e9
      https://github.com/siemens/jailhouse/commit/de7a2584ca2c601ac505d45e3b6e1da58ba5d2e9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-19 (Thu, 19 Sep 2019)

  Changed paths:
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Fix qemu-x86 /wrt VGA access window

Copy&paste mistake, other target were correctly set to a size of 0x30.

Fixes: 654594bc0be7 ("x86: pio: use a whitelist instead of a permission bitmap")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7cc0dc906976651c0a2f7561cadd8cb6af9ed707
      https://github.com/siemens/jailhouse/commit/7cc0dc906976651c0a2f7561cadd8cb6af9ed707
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-09-22 (Sun, 22 Sep 2019)

  Changed paths:
    M driver/sysfs.c

  Log Message:
  -----------
  driver: sysfs: fix parameter usage

find_cell_cpu gets a cell as parameter, but ignores it. It only uses
root_cell.

This bug never had any consequences, as this routine is only one single
caller, and always gets root_cell as parameter. Nevertheless, fix this
by using the correct parameter.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/955a9418df6e...7cc0dc906976

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/955a94-7cc0dc%40github.com.
