Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBO635XWAKGQE5TG5XVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E19CE9DD
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 18:54:21 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id l24sf8733527oii.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 09:54:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570467260; cv=pass;
        d=google.com; s=arc-20160816;
        b=za3thBs4Q0QQIPERV2w0DnemLjZhPxCwpE4l+I5JDxpwMDu6LK1c5ji0ZqWZbfIpfc
         YUDYG5iFI4Sm6bbfQQaDkubzkm2q+cJZpPVVW9RR/CUpbedi8UQ/sOTD2XIJDFvgad7j
         oKVBmw4jPop1Spv0avqZ7Bla4f0gNBWP/BPSkdJm1IX8+9kPcbUtFAXeV0EbG2jRDmI5
         WfgsaWBnC+hL5+SRlG1VcHce/6JXMqfdplEAP/dW5S0IUhcjRbew3t+x4PvD4Fgg5Ci1
         dWEHqaFtnoZJxJh5dXJbhuS+BAHQsUYQH4mgCOezBjRVQXx4x3MQF220VTECs0jOyC93
         z1IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=bYaXXllPk5Xo3RQvSq8gMNlISxta6m7P2tm65AvC8ZY=;
        b=0MnbY80hvLvb6gi6n4pCX5jJ8R7wLanwcXPmrYiOduhCqxm+l5Mlw+bKJNR8SiZNfl
         bnApNFX61r2P2j71KEATP4M1SrSMk964gStBXnNtTJLz0ELQQWM39kFrv8pk8ONpRx8L
         IfzvIev/gdz+ISNpvuUE2ALTZvEcD7Hrr6EoZprcIZU3N3VXmjTdLzvmx/G/opVPuBDl
         cMEsz+80mLGNZWKBABtYeYAO7Gpm5noE/x+QVEtHjUEDFQehBCg807VFglw9KEGfhoTB
         ge2S9w7gHHO0wLGVXVtODpvZe8gSN+TF1iuUZ8myL0WF66ZRZsm3j7ZaHulGv2M1dfGD
         pFDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="K8/Sv67S";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bYaXXllPk5Xo3RQvSq8gMNlISxta6m7P2tm65AvC8ZY=;
        b=Qjgc+vLOMYzujIvrixlZU8YYztGUCHl8fa5cwjIqAOrkxakq+N2bRQ8IIAKy4DIno2
         Lb02c5F5UmPkX5PfttZ/043dlj857pTPWjQ38Q5Blkb11+q3y4rD8cUQdJA3VqHzru8h
         XtezvqRwjhPMNKkTs/o5fhhQX28H+y+3JERf7G+PFSh4d6erpwiEEMnKffUJRQFN/zmS
         PDusj8txgXNqhGJznBQ+qDBWoOYYUF0+Slfgaj2lgrkosRLCr61Y+kFQ7UoLgDTnEn25
         tBP7OsMW0quBOI+LMKzspHQNKqyLOG87HlBujnPe6q7MEB8tAeeZg6Znneapja3eIwxp
         BtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=bYaXXllPk5Xo3RQvSq8gMNlISxta6m7P2tm65AvC8ZY=;
        b=oFYI0cHgdmNQeCcd6GSlWHet0Ef9xpf77gy5gtl73EHyXb5gkrTF70vJDl3znfXOJd
         ebSmRGo2gU+U9LLPGi/tc+rVzzYzk0BJ2oSS5U1B5ICqPHbMF6iK3z8tWNuz1DPrDxQ4
         30Vm84bVULMaLk1zJTnE5t8VfMeKUd0AketYbd1oAMoVVWVTw/uNu6FbfISAtCA88/9R
         Dc2mmtp85X4jHFFJbStymkOY3kiJaB9H1EHbGD1P3+How8Z9dHksV2Ga7C/zGeWnenc6
         70klNQcFeku9Eiw1tIarIBNfmojaoz3jHF8pPOe1SjnP3BiCkEIUj+Yy5ktQ4D8Efh5n
         CBWA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVLIVTtZSbvSRomPx1X7jDAY2ym7y+GXIRrSKdgYYwBDPdae6Bf
	r4EG5pxcJuM/SxLBwJFTtr4=
X-Google-Smtp-Source: APXvYqwZRn/qcV1JG24RGMDTITxozB9GXFQtaUs3Id3hbC9pF2TtS48CGs8si/9Biyz5LJDyt6g3kg==
X-Received: by 2002:a54:4f87:: with SMTP id g7mr215922oiy.100.1570467259797;
        Mon, 07 Oct 2019 09:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:de9:: with SMTP id 96ls52296ots.6.gmail; Mon, 07 Oct
 2019 09:54:19 -0700 (PDT)
X-Received: by 2002:a05:6830:1d6e:: with SMTP id l14mr21808762oti.3.1570467259164;
        Mon, 07 Oct 2019 09:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570467259; cv=none;
        d=google.com; s=arc-20160816;
        b=maWmsWMVcKxQJLZ2hSZwTHtbn9gaZaA3pNYlnRuYsgwnW8k72OYDkY0qsknDinPX0U
         9/kRmSZk5thBCW3l7Om6ruiDIgBF8nxyHhEtS0kMd+vE/FXVNiUeLsy3lz/xZJ0g7xKZ
         Tx9F2u422cqsalPrNIBhqM9fS+p4CzEymxAGLsbNX92PTyt7hvnuudpCcwbUx48ichgi
         33i7bcLNFZkMRYMl/UJiF0xMy5EgHhf1X1at2x546Vzugc99NmnH5a+iLueK/ymdgIoU
         McMbVlYHk7pQ+ar6sBs71KsFyy66F0rflbLgNg6VinWd7ksGO4mwqWpPaQg56LwLke/T
         uOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ospVevHiEKmOBAlHQcLLyqtxzCZzKHeZKTRr4mEVsGM=;
        b=WiuSxjEUGheCSwKNnvQ78oWS45prHbDitJWRZPszaJN3D3tP46NUFoFxLTFD7qMuX4
         1CTQ3Zaa2/LuM8FZnZE+Ov7Z8bKnRH4/Tzj8lncE85Dr/TWvU6Gz3CGP2/l/0vJ1zsXY
         QbWtbi4rqtLGHi8OBBSJB/tEi+Pdp3dXxMMYMpmIdbKGUBftLPO4F/UpEXnO78NFAq+R
         AyMAnNpyFmB82u1q7jugkU/YpFiP+4FsVw+hrFEfNnXPOl0hUHz3JmMoeXcJdaRPcx1h
         3dmNOejQq7XbFIVin+9zTBI5s5Hv4uj0Out5KdWVM2IUMqAOWzgsqHX8OW7U5c8sNto5
         5ApA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="K8/Sv67S";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id v3si918889oth.4.2019.10.07.09.54.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 09:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Mon, 07 Oct 2019 09:54:18 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8ff311-90e8d6@github.com>
Subject: [siemens/jailhouse] f3a34e: tools: jailhoues-cell-linux: cosmetic
 fixup
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="K8/Sv67S";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
      https://github.com/siemens/jailhouse/commit/f3a34e9773e4a64957e7dee8e99d2bfd55b08ed6
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  tools: jailhoues-cell-linux: cosmetic fixup

Just for the sake of consistency: s/memregion/mem_region/. This is the only
spot where we still had memregion instead of mem_region.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 90e8d6cee27ce04ffa19c2203b334c4e0f319283
      https://github.com/siemens/jailhouse/commit/90e8d6cee27ce04ffa19c2203b334c4e0f319283
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: simplify statement

No functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/8ff311b9a5a6...90e8d6cee27c

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8ff311-90e8d6%40github.com.
