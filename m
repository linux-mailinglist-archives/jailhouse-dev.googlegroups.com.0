Return-Path: <jailhouse-dev+bncBCE6JKFIVQARB5NFRP3QKGQEPSANGHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 113291F7181
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 02:57:27 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id m5sf3449899otp.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 17:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JupxuI9eLhjp5JVRqzQCI+AnO/PvIemxrL9Dc6ZrBKM=;
        b=QE4vOh9tCnIjkqJ7AfvqQQnYyOWB69xnjJhYHWzi04v9ODDH5ozrnNd9pirKT49IiE
         ucBSZeGDvVbvdcHE5bOwDm4BMCEZNvILFt8Q7Pcd5KEoB9n+FLPG6mS8OSGGc4SjSyKb
         ke9D5DwgZKi9uUFCHGLp4AVRxYOl7+EHMBGBnSohhtZ4op3XxcPEy6USViqb5isbBMaK
         Y+gdqBqJ8UWuxnyS6Mur5bWHaqI8jKTi+c7U8EPBwGDz7Gc3AzJeVwXPGXFGe1tUyYeH
         HttEO5zFQnUGqVUk/2dpgOPRCTV2kvi9LSyU2agEJhvnq3fbAMUgyW/BSeFtMF9JK08H
         i5jA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JupxuI9eLhjp5JVRqzQCI+AnO/PvIemxrL9Dc6ZrBKM=;
        b=cdElU7liXplx4nxCwFo3woS2nalZDzEyc9Zm1tMRult0A37h9D+KJf7DX7fx8o9raO
         NpZakgJwIYRRKUVTmSeAu92xzpG/g5FrSuUN9ihbij2XJ+IOUoU3nTQaUTTBRQRapKmS
         PklSJLiB1g2acQikHKUnkUI1qxJkWdAx1TgyUEELt3OO9rtFpv5PGBGc7+kXb3WGrWHO
         DVutykOKQBSjyX1WiFuinwC39jtGZQXRxSPFey08mzrurW17s3Qij4EaTTsxoKteES7N
         DaDUjF0ZrxtzxdFAqPIH4pZu8RWnxT+e+l55aAQKXhTg15h6A3tiDSMiCAOu8rdnYs9c
         mLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JupxuI9eLhjp5JVRqzQCI+AnO/PvIemxrL9Dc6ZrBKM=;
        b=ANNN8Aq61RvwxewW/5sbrsBT+5RuPGE+iU1rkGAeZmdZI2VXmVKqEw1gkloF9xexzt
         CmDS7f6SMu/96cNy6HmpAh4Zn7naIOlrwe/JdujHudUanI05mKtN5szfUCdgEiUW4Vqo
         vyGteDRPypkB3xqlKCE52u+qKztHhztM2uE1BAMJ+ls5F/zxXDD4sKazgOYBoOYGGVQg
         2xnOmsrJe4b/QnBaWDYBFAIs3OfiYAuxBRwQ6epVJenu+S4btgZnVo6t0Mag17gi/g3Q
         UJPU1Z4hrYvDjtybayApo6XGg/kK0mTH8sQ431ofFWuqGory211+0/dFXdar/MjetC+g
         sGKA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fgP8ARt0bcSOVkHFpW2Z8Gi7PjdheI9ACrTPM87JHUuUsUPXa
	vylDdpF5bXyZfhw9s/OMwpk=
X-Google-Smtp-Source: ABdhPJx7+lBjDrw7fGTg73li5ADEF2xVDL7PHBHNEnMfXmwpcKqnUXt+npuD4PtY9SY/rRyQgw+Dfw==
X-Received: by 2002:aca:4e46:: with SMTP id c67mr513783oib.1.1591923446078;
        Thu, 11 Jun 2020 17:57:26 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7051:: with SMTP id x17ls862510otj.4.gmail; Thu, 11 Jun
 2020 17:57:25 -0700 (PDT)
X-Received: by 2002:a9d:88a:: with SMTP id 10mr8755320otf.274.1591923445510;
        Thu, 11 Jun 2020 17:57:25 -0700 (PDT)
Date: Thu, 11 Jun 2020 17:57:24 -0700 (PDT)
From: Pratik Patil <prtptl.smilingcorpse@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <9b648b5a-97c7-473f-8631-d55064a5b69fo@googlegroups.com>
Subject: Reboot root cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_115_510874438.1591923444884"
X-Original-Sender: prtptl.smilingcorpse@gmail.com
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

------=_Part_115_510874438.1591923444884
Content-Type: text/plain; charset="UTF-8"

Hello everyone,
Can anyone help me with this problem: 
Is it possible to reboot root cell without stopping operation in non-root cell? 

Thank you,

Pratik Patil

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9b648b5a-97c7-473f-8631-d55064a5b69fo%40googlegroups.com.

------=_Part_115_510874438.1591923444884--
