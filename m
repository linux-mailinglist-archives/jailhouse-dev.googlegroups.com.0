Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBAWTRD3QKGQEK2I6M7Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3a.google.com (mail-oo1-xc3a.google.com [IPv6:2607:f8b0:4864:20::c3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEAE1F6851
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:28 +0200 (CEST)
Received: by mail-oo1-xc3a.google.com with SMTP id n15sf2792181oov.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880067; cv=pass;
        d=google.com; s=arc-20160816;
        b=KJ3vNrnmPVP8AI4/tZJQxTzHLy6VGeqwY72pgiUG6aaDyQiW8vFxb4wvj+87XEK8fE
         8I/gOlK9jblU/gnnXPpX4uqldU7m3k2f096AmIuk9fKU5YtkRYu153E6fzEHOeRS2ita
         rE+3cxha6jjT0rYu39oUFlw08O/uGBRF4t40YtaoAHfNrT/BPNC2MpWDLTzPVYUCX5pd
         ZyEL81zeiaegHdOMlSYyOgic75+KkLLoMliIq6vJS5ze0/RAMdhlyb3AZl7uHghsZCI6
         KDpVgc00MREUk/P6uDcIG3lQG8P1sseTesQ5JFfBIdmoP4WUowDHhz8Mm05vubrkLFBS
         S2eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=ZO8NH/dE/kzleolHQdCrdt9mSB0CIVA+0uSw6Jg2EWU=;
        b=Q1wM1kt4gnAPjn1tEyvEevpzeVnkgdc6eXcjvLa6F8+fTZzsGmhQecoqqSeLyBC15B
         IU3JZflkV8baJdNS5L53B4P7nYG1xmeaR3ioHlvckDCR754Nwa1XEshX1461YXE1/DQo
         Z2BMBE822HnnH7fhizWhu2mNijlJCEv8uXak/xs0565V3vYeGQeNxLtUxQKvNCubJ6AW
         NnUe2VtTGv5TuI8UVedrxQ3byTXw+/MfZTaXv9Fd2/UXEcg4sRWI2zfGNFBSjK6Cp82X
         MJwNWb0bQac4AGvfEqnFesPx4NAjrsDdp5sY89M7JpaUPnTwCJHCK4snoB34dA3LWtPA
         +DPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="c8La4/s6";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=ZO8NH/dE/kzleolHQdCrdt9mSB0CIVA+0uSw6Jg2EWU=;
        b=lwYIWrm6hHbZrsIPHc8kwXdxZ1zbaesGc6X52HxbKoZl4b2/y7AMPZx+0usozgwMiX
         cWGIkLqSWPAK7P4cdMjmlNcCcyygNmXnpervqoy9jjHHwMM5qzF1bNBtrruYWVNnh+Yr
         dPM/4ofiQUnALbuY2o+rpVvwSz2AIdWKb5ElpKpT3OeRYpxxNVa4TcoHTtFb9RkdD+dp
         ufjlTUNsZDiD6EPmMwmNhQaJ/SYFQFzaxqt4tAluCEwvLfuhJZEddTZsJ0ssGIxam/Pv
         0guTEL2BXw5D63Lapr83g/EGRux8WyOk9ahlkbJjxzDsQ3AOYLULhb9nCjWLhoM4dY3e
         JKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ZO8NH/dE/kzleolHQdCrdt9mSB0CIVA+0uSw6Jg2EWU=;
        b=Db3vxILn2ZuaZWd3ugSYnQk2er2zX8wOrsnMSo9abyoVXIhmR1D64TpWOeAwAbZx1M
         wPmxFv1ojUhyIt0BFTkz2yXJacfupS7Gc+F5T0AO0ZKf0j9LzhF+b+6adTx2LRNUSkGu
         6kHDniDXKxCWwR7eCyQdOAEiKmnrqaE1EGMj+KjYQOQPZMMM2zAYLhtUScYnqBL15DPF
         KvIcU+FRml8KX/u2xJR9vTgox+lWYfAX5aRuJJW9k1lKRHHuXIUQ1HIwQbOmhJLtHji3
         JHXhSJrutfpCrM/W1UifhF/ve/1G9DtOxe3UqmLfDmcnHEwePlqaG1qJSytbmhgerpGr
         7WEQ==
X-Gm-Message-State: AOAM531KNJBxMvZ+xAA5PDG4Ro5qAksueuwtgcYzPMPC1pMKdrpHFacN
	n0OY7KgbejQlnXMl5ZKDBGc=
X-Google-Smtp-Source: ABdhPJzhLm9hCxrCLF7ljPvC/sfMmEE1w5Zqc/av91bBLjW9eBtcLBLk7TfFqxlUiG62zFiwa0pwvQ==
X-Received: by 2002:a9d:22c2:: with SMTP id y60mr6109067ota.70.1591880066887;
        Thu, 11 Jun 2020 05:54:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:61a:: with SMTP id w26ls437583oti.8.gmail; Thu, 11
 Jun 2020 05:54:26 -0700 (PDT)
X-Received: by 2002:a05:6830:1dba:: with SMTP id z26mr6649284oti.180.1591880066413;
        Thu, 11 Jun 2020 05:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880066; cv=none;
        d=google.com; s=arc-20160816;
        b=PaOVg4+1CiMRruwU0l3SjZtvxb40kf/GP4dII/gRG7a6/dUCslwS9Ezn/MEpWVY0C5
         cdWU5xHVszIeIcC7JmqMdXjOBTs2tPuLzfr4ocoz+fUJN0kjClu539zHXXfF7ZxT93H7
         vGN/b6Y3HfkptkNIRJhJ5Nq0uIB+UzIUv3YfLfzkNvieKuhoygvP2gS2CSsq9Otrm/E7
         HbIPVnz84h9i35pGVhtYL3o8EP/iBIXscjSddXU0IFdgERQcpfuuYey55DinFSd65Mch
         quQ/r8V0JBsv+I+7vbThlqJ6DbPLXcYDbuBRWmg+DdgvnY+AoZpe5SzPs+/Q5Ls0NdP7
         aHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=ntt7F06yc9/9PCtoB4iOoKlWssTH8L9jN0DixSVkKTk=;
        b=OOpQOVUnmm+DZP5rAsyVQA3zkU1dYnQohr5WskQHo+CoG8fsLu0+tI9qTv4aT8oK6g
         vWzhaJ7DS7mZ1yvF6a1Q6clx8eYzJUX//8qqF8ZECHnp520TDqHzzssh4P1n6ApDNQl/
         HTF9Fv2a3tJnLExVbGr4nTNgFFvC98IROpRUl739fTut5varlLbl5WXiM5VfHQ9s/8Kc
         xgODGAad/rm8ooRIeb5yEeBwAp2z59jlBzIPiZAh5kYrkEG5p13YhjY/VmVyZ4VMLrHj
         pnkQN6Zb57Y3+tD7KYl8j/qyFbh0cbv36G8HysSnRRJHw0v5iVm4keFAdme7/5egBwS2
         evEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="c8La4/s6";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id u15si231877oth.5.2020.06.11.05.54.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsQ0T079733;
	Thu, 11 Jun 2020 07:54:26 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsQjL119604;
	Thu, 11 Jun 2020 07:54:26 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:25 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2d062138;
	Thu, 11 Jun 2020 07:54:24 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 0/9] Enable IVSHMEM demo for k3-j721e-evm
Date: Thu, 11 Jun 2020 18:24:14 +0530
Message-ID: <20200611125423.16770-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="c8La4/s6";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series adds support for ivshmem demo for the k3-j721e-evm
platform. Since TI kernel uses 64k page size, there are few
improvements in the Jailhouse PCIe driver to support this.

Also, it generalizes the linux application and baremetal demo
to work on different platforms with different configurations
for ivshmem demo.

Last patch fixes some overlaps detected by config checker.

Nikhil Devshatwar (9):
  include: cell-config: Add new macros for 64K aigned BAR
  driver: pci: Use page size to set the aperture size
  configs: dts: inmate-k3-j721e: Increase range for PCIe aperture
  configs: k3-j721e-evm: Add IVSHMEM demo device
  configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
  tools: ivshmem-demo: Map memory regions with correct sizes
  tools: ivshmem-demo: Pass peer_id command line
  inmates: ivshmem-demo: Parse target from cmdline
  configs: k3-j721e-evm: Fix memory overlaps

 configs/arm64/dts/inmate-k3-j721e-evm.dts |  2 +-
 configs/arm64/k3-j721e-evm-inmate-demo.c  | 66 ++++++++++++++++--
 configs/arm64/k3-j721e-evm-linux-demo.c   | 54 +++++++++++---
 configs/arm64/k3-j721e-evm.c              | 84 ++++++++++++----------
 driver/pci.c                              |  3 +-
 include/jailhouse/cell-config.h           | 12 ++++
 inmates/demos/ivshmem-demo.c              |  6 +-
 tools/ivshmem-demo.c                      | 85 ++++++++++++++++++-----
 8 files changed, 241 insertions(+), 71 deletions(-)

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-1-nikhil.nd%40ti.com.
