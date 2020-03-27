Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBVGM67ZQKGQEN5MF7HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 72886195683
	for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 12:41:09 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id w12sf4418951wrl.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 27 Mar 2020 04:41:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585309269; cv=pass;
        d=google.com; s=arc-20160816;
        b=VLbVY2qujBypVm6gQrL5QMP7ftOZR2TuPle9nNYnwdCn0Pg5iIcLK9bGgHSLf28sMt
         cER5oscAqdk9/ShW6/lD8PLOiA4Ae7ijyiM2UFZXAH0O0GjtcJSk63tmOK4VZHsSV863
         UP0ZycWWEWhCi/Ft6c/k6LNq1Qv4tfnUzA9x22HOsR8oyBfAPNA5NEVNSIZHQ6JX+rJQ
         ypqPuCoinSxsQaFaVjvZCTWnswMyRdDB4ZI9H9ejUZ8OolCqc+thnWX5cgMBL7YkRNDp
         nzQ+OLFhufnlLZExmwaCo9QIVPD0jLkRbmC1PBdEvTmsXsNY+1uo8NSi8Bx/gQf5eXUd
         f/tA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=u/SrR+vYzZh/Uo3GeVPqARDnfJYyZPRFS2dGmpcUb44=;
        b=NWMEiz/TZJMI1QbWSA1+4ZmIuMtUVkGMqe2sFEYqiKhKXNMrv1sGbbi6vmyPJEBBBC
         f/N5aOLqT6wzzpy1Vpd3li2Y8uSOpYMBQ/XCs/wQqoy4D7i9gLbyqdr1eFFli8RaYK0y
         x4vgXvYNEOykM7hJegXIgT3AOfAE7ILd3kXQ78jHb6INJV8LVj8AU46KCh5v672o+a+A
         yhCyWhiqVVyhr7EPW7DlTi++r0uFThe6TSkyA8f7vvlbbytv1EhsOBSvC+85Eoha9z0O
         ggWhw1FP7seOei4/RxEz1iCR0CAVntPwXsZHnHet37c1RvpsRiZeF8iu9q0RdbqqGDua
         z5+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ij6TelDs;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:date:message-id:subject:to:cc
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u/SrR+vYzZh/Uo3GeVPqARDnfJYyZPRFS2dGmpcUb44=;
        b=HRExZduD0Ywsef8BheDfAMUrnJyFTEGj99mrJn7BvHF6qAK/yWpu3geM1c8mh95akP
         X/jjmTGeTKXFe9TqmZJTJqkbxtypf7rRs/fWSR8Ae0nGRvuDw66YB2PO3lN78JoogUGc
         MKCso/f4eJt8RKQmzTKO9bg7XX0wUzZy03GIDf7ZrDxEgr619o0YCFQ8on61wgDz409F
         GBD2kHaWep/5tWltfsIL8D7oTLmA7PxAufEBmS0EqVXJuqYoQFAQPCxGh5NmQN2IpytW
         /aVxJlPkhea8vz4JQS8k+1srUzf9TSmgVizkVVXjvFXqHa8tn+GLx59lSrfCBqXNmn2S
         l2NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u/SrR+vYzZh/Uo3GeVPqARDnfJYyZPRFS2dGmpcUb44=;
        b=qlzXAlww66S2qbdQX2kwXMRJqke9t5XppaFZRkGrmZKmGSXAtkbKFEs41p39JyaLam
         jUktF/SMhCnENlNrb5X03bza3HXb1kA9ZOGj5/bpAJr1/dhbm2YACeM+JhQk5SpLpyS0
         85Un3p1KGCV0mom2nPqQFzPD3v4FpfcHfCwU80hsO/AiUmWnsEY1pLBgAzAdKKStLiEF
         Y+TjNRWkoQnzpqHceXEeLATn87mD3mPSKVfSqkPw7ngyawhLl7o1aJL5ULltc4ZndFag
         FkNposFIgdFDuqr7BClWiMKoJjpmT07AVZrQLx5L0okkoNpRKcIGGfh2NmMuZ+p9Tnwr
         kxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=u/SrR+vYzZh/Uo3GeVPqARDnfJYyZPRFS2dGmpcUb44=;
        b=E4IUHy+58e2bhbf8dT/eESSljoB1zkzm8QNc4Y1eZDkGMTAHtc9gcB9xL/rUzLaSLD
         NR6ay+kJDVRCayCPC1NA8W5isY3aOLERzu/qDxi4UuC62CNWcDDFLakLaMKJuqO1XEGU
         Nj+Qu06tqYrYWhkXWbnVKGEUpXQl7+sattgKki2r6r9qgFt11dzXZ/dggWLKuFOOAeeK
         DPw/dROIW2soZqVlmqWgrWMIHmclLLkStOTTMZLkD/5vNvYnWEsAAgwy0IBp2qVYI1xW
         rG2bOwJAI+6k0Z3c85OUS/cLK2ka6EEB79PPTm47aeQ138UOiecscdpfndrcqCbjQomY
         nW9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1LU6WjVnGGSUs+JW/uiWL0aospOsWx/1iGrGCBOZeSFSmk4Y1S
	NF8zE4jYawTPFM7tG7qO05Y=
X-Google-Smtp-Source: ADFU+vtc58gMegUj3+oRQw94o7miCwOS60p9I8Mz8YGq8PqkHOTh+f2vWsYYhT/C6/cyFLULnEwzAA==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr15837509wrm.153.1585309269210;
        Fri, 27 Mar 2020 04:41:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:660a:: with SMTP id a10ls316871wmc.0.gmail; Fri, 27 Mar
 2020 04:41:08 -0700 (PDT)
X-Received: by 2002:a05:600c:2f90:: with SMTP id t16mr5128760wmn.66.1585309268300;
        Fri, 27 Mar 2020 04:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585309268; cv=none;
        d=google.com; s=arc-20160816;
        b=CgHJ3kDA6pWmZ303FMryTZ87+A08O2MrQ6o9Wnz7XSD3GeYfnQyonX8skt9QzbRrQd
         AeKmhz9weM1T9xSX54Qkrp/gD2IMioq8Y37n9bN4hFWY1KD1jQWvx2VVpS5tpGr8mKTQ
         hX7kJB98u4hkV8XV5VSLldLBYOvPPLY4fT06olNl35ZWOqEFni9XRV8iORM/OmSRlksb
         N6TEgtLnfwGd8HAi7Ye7ODH36DthYA1tlpcas4fCYZJKmJ/MS8nLviwsQxWS+pSu2L/N
         o251Ls5Ap1BLIHQ6xdeAmH71Dnbmr2RZy2AQguaLQqpx3gKe9+cNFgTlgkb8QTQTmiIo
         Zv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mzf8rPaJiw/qkfbPRAzvbcj5cgY3o6b4uFNtbTPVZow=;
        b=tgveI01HT3iruTGPj1pvA6e9GDFFmPbcNihgf51AzHq0Ny6ErOovmA4hF36ci6/KeU
         MfP4BrNIc1J9LWw2Iki+6G3Xq0IrSTrXYeVMLV9aix2tkGLL3YEF+bnNJYY71apnI1tw
         MEP9RCWzNAP1gC4i8eekZHe+PV/HL0lEHDqsGk6ZJmz6fHq0N2hQdmOXytNNq/yfaBAV
         II3jbh3PeD8WFnNR/+PRTn1Xv4WRxeGV71FfqnRkGMKlKdFkaWqmmcg49PLQjR0lj5hc
         AkthvSp5YW2VqOm7qkPpuAKDcdjYq9DPO07UbBSuuBAUfmet58jHt/SX2YqmORlv+d3g
         BqoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ij6TelDs;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com. [2a00:1450:4864:20::52c])
        by gmr-mx.google.com with ESMTPS id q2si257696wrc.2.2020.03.27.04.41.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2020 04:41:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::52c as permitted sender) client-ip=2a00:1450:4864:20::52c;
Received: by mail-ed1-x52c.google.com with SMTP id u59so10613656edc.12
        for <jailhouse-dev@googlegroups.com>; Fri, 27 Mar 2020 04:41:08 -0700 (PDT)
X-Received: by 2002:a05:6402:1257:: with SMTP id l23mr3998956edw.197.1585309267996;
 Fri, 27 Mar 2020 04:41:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:1e8a:0:0:0:0 with HTTP; Fri, 27 Mar 2020 04:41:07
 -0700 (PDT)
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Fri, 27 Mar 2020 12:41:07 +0100
Message-ID: <CADiTV-1QiRhSWZnw+kHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw@mail.gmail.com>
Subject: [RFC] Linux-less boot
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Marco Solieri <marco.solieri@unimore.it>, Luca Miccio <206497@studenti.unimore.it>, 
	Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=Ij6TelDs;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::52c as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan, Peng, all,

We currently have a better understanding of Peng's work [1] and manage
to somewhat reproduce his results on another NXP board, the IMX8QM.
Since you showed interest in this, we would like to start implement
something a bit more portable and user-friendly.

In this regard, I would like to share some design choices:
- Jailhouse image stays more or less the same, all the code is added
into a loader, expanding Peng's work to make it more portable (across
Arm v8 boards for now) and generic. The loader will boot and init
everything that jailhouse and the inmates need. Without the loader
jailhouse can be started exactly like it was before.
- The loader is platform-specific, and thus it's necessary, at
compile-time, to have a parameter that specifies the target (something
like `BOOT=` or `TARGET=`), using the root-cell information to fill
the correct addresses and compile only the necessary drivers. Without
the parameter, the loader is not compiled.
- There is going to be a "sync" function at some point, probably when
loading the module, that can update the status of jailhouse so that
the cells created at boot time are controllable. The idea is to have
the same situation as if jailhouse was started with the `enable`.

Finally, we would also like to hear from Peng, to understand his
current plan so that we don't step in each other's toes.

[1] https://groups.google.com/forum/#!topic/jailhouse-dev/IZEFz-e2lh4

Angelo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-1QiRhSWZnw%2BkHhJMO-BoA4sAcOmTkQE7ZWbHkGh3Jexw%40mail.gmail.com.
