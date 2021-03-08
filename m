Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB2MPS6BAMGQEGBK47QQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id ED68E330861
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Mar 2021 07:44:58 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id 97sf6604045otm.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Mar 2021 22:44:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1615185897; cv=pass;
        d=google.com; s=arc-20160816;
        b=xZN45eqKAvhIvrVejmbZYnnDH78vPEYxpdT3hzhLZlYuV9DF/dWlejvIyMMm2fUc7P
         syvmk9fO2dGvM2ktF+sINmeTnGAPgKSaHkVVWIVCBEW2w0w8ZaUO9UU+wLJTwgxUTWoM
         ky94PPO/59eWsoOYiBh/XUK8H9LPvg9X/ThBJHvZMr725HBCMT3dmnPS6/MX50zdGWan
         4KyH7XhTo1BiMnUd4LKXFflzayYukgs3whk06dQUh3pygz10EtltFiPj6+ZoeXxCqqAi
         +dCUmjH+kPFFJ6Bpw3wmSkc5aAJUgNh4FpnOhfRKABh+WTZZhH32TPqR6qPtzzr6KF94
         X3CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=c1duh7g5BDKNMKi2ccydwgCYRcz38nKUCA4DZQVmv/4=;
        b=dDQLQ0V/cgGh56KhE2DLv2mzuX1nf2afQyYDGWkrN09oIZtxnxVi8af46DtOruBMme
         TTGDsCtBqTk9vNBdLKx0rIlqj4FVGwDTykOjJNssp5P++ZaV97IJxRbVUwvVkiT5PFpH
         JyCHZLLxfRPE0FoBYuCBVNkDqbCZWrDUtzQom2pqc26Z9XUdOH6+UHt9TgSXhcK6z1cI
         Idd6kg2v1t0FnrkUmq1TTmhvvqjrvU8AWUOQwTJaHYQ3bklFdJC89JAd+Qvjx/wmxpYX
         O5pTxxMWxwDlovv03Wzu7hKFDIu+CSAJWNcb3VROa+KzZ5QtBWIv01Az68EZ2Yj9xhNY
         vyyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=svja8WXT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=c1duh7g5BDKNMKi2ccydwgCYRcz38nKUCA4DZQVmv/4=;
        b=Y5qigpE+qhVcfT+zY3DJN5gdlwuXR6ChCQUqxgbFat44KOEeTKsLBiic/U/9hbSk4G
         BMQMgRVFiE+ev5u0pEndbvwA1BgfFHcoIkb5iUGfYj6Jz4XKOmLzE49/a5rsQf5EvQ7v
         lKq70fTN7NSclSOvLo421oyzMbtGwDvwWYXtAQeoV3SDpi3F+yQo+WonpS2BoOngE61s
         KUxuWdv5RTIs1aM6t85otl4l0cGsj5ZWOyIUcYLU3Vk9in+SiLcVpjomh+npQWZ+OMTe
         c2zJ78SJDO7bLOlBc0DbQ2cBF9Ubw/mEziYeuu1O3Rtz2wVxtWyPpDlesoFeUSjx8Bt+
         x5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=c1duh7g5BDKNMKi2ccydwgCYRcz38nKUCA4DZQVmv/4=;
        b=A3dt4nd+7cHTkNcLnUP1MW33PZ1xTG/V8vIdJeVlMz2QwWYh5vSAEc8aBQJJtR9OW8
         sw+JHxqoHjwWohvgG6dh9JLhywE+M4e1DhT0lkz0DwXq8dGqBFtKFJdFHXtv0xu0iifw
         wYyI2bztql6qDrEhercboiFGt0HNj0GNc2hi8zSYVQ+eB8wv9lLtnRZhmjbUF3LrZKOB
         yNu3oaxoPmjQmA+KvKDBUmDdAFMw5Tan+rsH9vmU9TdwpesfJM6hpHsnpB6aNNWHwEb3
         OzW98CxGzUhExBaskD1xIzc6ydBuNefUur7yaK0DFdyqtSfZeVdhVS0azxHdX7yNZRLP
         GHQg==
X-Gm-Message-State: AOAM531mfB/FkvUutpb0DwycE+Hk/bAYmQ7t8+kfxg7wr7zf7OdDAi5U
	ZOSagQnSRZZWVJEHLGBcn4Q=
X-Google-Smtp-Source: ABdhPJyjTxyZG9igwQBYyXgfYX+LKadwgVmpyqpV4JHcopGai4A7/LbLbnjeNx/fvLNeKW5QaJFziA==
X-Received: by 2002:a9d:1ca1:: with SMTP id l33mr17708748ota.368.1615185897669;
        Sun, 07 Mar 2021 22:44:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:9868:: with SMTP id z37ls1023348ooi.6.gmail; Sun, 07 Mar
 2021 22:44:57 -0800 (PST)
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr17679996oot.25.1615185897252;
        Sun, 07 Mar 2021 22:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615185897; cv=none;
        d=google.com; s=arc-20160816;
        b=pLMlLhSRo3nPSmD9Bg2q7+if1WTCFiCNAWMLHNN6D58bi/hssVDpSG7Qfgzz4iZvKs
         OdxlhLD54Il87oL8uq+5K21w/DP3sr27apTT0qDmwa2qygmaCwrezB5jrKNXEQLiPaLj
         Ipkax8uMx9lUUMkHygR7kfxhnra1JGCiDO2XrhPD3cc9zAFNeATbtP7Q6JSgFlDkBPzL
         A7lpsUlD7nw9QHfA0yUteLECk/xLLRbt6+sVJNJsk/S0EeDrFQHdiMYgE/GPyqedgqce
         MsJfpJmJxx0vrSHKzgYCWN05oZy0cwrYrPBxjE/7QOwcadBLf5pHEXkySsWVhkzZ2k3d
         bXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=3SDJdCgDpfbsYd58y6YmY+0l3VjA2gQw75+srtL5Vgw=;
        b=kQQ/s69oV3k5tQVpMZhyQUH6HdrzBiG7lwqHDMQs7byowBO3ZsIqH8/Fb67NaOzXkv
         smnbg/NPjpgOsMZ9gVWoW+eCDor7ttcDe7y+66cKydhd+OblTllKysYR6OheslQZGZsS
         UwumB/mQDy7QnMibj5vaNQMJUYoOed5wEmxdqKHBKMEdTJLNTS52k9dgvVx+lvlNhA8A
         MOIPra3hdcgh9nul8Ej8CWs+xzZMcp99YQWQ2kNa7g0HyQALbSr1QGJtgv4rZlBBXjXl
         4tT3ihl3otoy0OZAqhFIEcoDykMhlq98W3OVRJ2F29KtVholnKgGITJX+Pr+d1qIpCw0
         npfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=svja8WXT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id c7si787740oto.1.2021.03.07.22.44.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Mar 2021 22:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github.com (hubbernetes-node-86f48b8.ac4-iad.github.net [10.52.125.41])
	by smtp.github.com (Postfix) with ESMTPA id CCF18600230
	for <jailhouse-dev@googlegroups.com>; Sun,  7 Mar 2021 22:44:56 -0800 (PST)
Date: Sun, 07 Mar 2021 22:44:56 -0800
From: "'whbo158' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/b91751-6c0978@github.com>
Subject: [siemens/jailhouse] 2a5249: README: Migrate to travis-ci.com URLs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=svja8WXT;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: whbo158 <noreply@github.com>
Reply-To: whbo158 <noreply@github.com>
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 2a524906c8cf573c1794fa300aa6c11bbfbd02f6
      https://github.com/siemens/jailhouse/commit/2a524906c8cf573c1794fa300aa6c11bbfbd02f6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-25 (Mon, 25 Jan 2021)

  Changed paths:
    M README.md
    M ci/README.md

  Log Message:
  -----------
  README: Migrate to travis-ci.com URLs

The project has been migrated, just update some links.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0efc2dcaf48bcac2c11636ed2db41e42dc091773
      https://github.com/siemens/jailhouse/commit/0efc2dcaf48bcac2c11636ed2db41e42dc091773
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-19 (Fri, 19 Feb 2021)

  Changed paths:
    A configs/arm64/ls1043a-rdb-dpaa-linux-demo.c

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in cell configure file

This file is used for the case that non-root linux cell own
all DPAA1 ports, root cell don't connect ethernet via DPAA ports.

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, can choose this.

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 00f355b58a17fc307b73673a5f962a8c36eda574
      https://github.com/siemens/jailhouse/commit/00f355b58a17fc307b73673a5f962a8c36eda574
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA fman-ucode dtsi file

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
[Jan: add copyright header, remove trailing whitespaces]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6c09785cb079caa3852759ab59f0a5431380b200
      https://github.com/siemens/jailhouse/commit/6c09785cb079caa3852759ab59f0a5431380b200
  Author: hongbo.wang <hongbo.wang@nxp.com>
  Date:   2021-02-27 (Sat, 27 Feb 2021)

  Changed paths:
    A configs/arm64/dts/inmate-ls1043a-rdb-dpaa.dts

  Log Message:
  -----------
  configs: ls1043a-rdb: add DPAA support in linux inmate dts demo

If user want to non-root linux can connect ethernet or cloud
via DPAA ports, and need high performance, should choose this dts.

This file will include inmate-ls1043a-rdb-fman-ucode.dtsi
the related config file is ls1043a-rdb-dpaa-linux-demo.c

Signed-off-by: hongbo.wang <hongbo.wang@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b91751cc3ce5...6c09785cb079

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/b91751-6c0978%40github.com.
