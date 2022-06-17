Return-Path: <jailhouse-dev+bncBCX7HWUSSQARBW7EWCKQMGQEQJTEQOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x739.google.com (mail-qk1-x739.google.com [IPv6:2607:f8b0:4864:20::739])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469954F234
	for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jun 2022 09:50:52 +0200 (CEST)
Received: by mail-qk1-x739.google.com with SMTP id bk10-20020a05620a1a0a00b006a6b1d676ebsf4291259qkb.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 17 Jun 2022 00:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5UuPh9tR8RptfT2Yw29HwfHf2wwCOFtFmjY/e4JMHvg=;
        b=RLXtzzo3WxJcGRDphgdZYQgjg1Xb08SAiER3oQkDi1XuMSnXGQsU7GDt4iZpPHjtho
         SBsqcGAQsB7oWq5rMesuShwUrCmE8qfuHGO6/89iW4r4ArHNqDpxt/S7Lqu6MV2GAqZG
         8FbK0SpAwVVcgUWTuVpryKlsJatJHuVrXf5/oBYfWx5r4nmWiRPdEBZCP3EM9bzwy3KE
         JETm/5K3FTxE8r6KJivqklUqZVHLoxgE8x64JKs6Di08SZ5ySe3LmrusAHnj7NZVO51C
         EZ5bPnWS7Y1JK081dTC63Of2kzWysidetJ866qnujLkKzfZ+oDzuqh2K66889UWKkwJ9
         y/Ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5UuPh9tR8RptfT2Yw29HwfHf2wwCOFtFmjY/e4JMHvg=;
        b=V6rvWJ75/xtxk+vnd8HUVUyqLKVWeOVoZUO0CXQD84JyRxJ41bjIY99mgYghjszTAR
         sKOGwJ/tgF7ian8RW8PncYPWosa3t1IPH8SpoxTGdjCw1I20o4hjNzUuGqqiQTNWC2FB
         i87TtyLV4576shgcMBrSm9yhrL6VKjpIo77g0U3tJFSyBNWgz5J6Ofh18RuqCXvB/ZEE
         wbNXh5nGfyHlCz4v9hJmUQyANYKxptwCw/EMtNmdOr35NOT2z/pxOrGvBID9CBiNhq+w
         OGOOrYVH3RnkxCnIkubELH6qbyAhpNwZI4m7qEGfoWwtIHwGwxnFJGfEMxQ/mU/KmfW2
         KgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5UuPh9tR8RptfT2Yw29HwfHf2wwCOFtFmjY/e4JMHvg=;
        b=QeMnpwW45YTXiug2xFD2KPvogrXQHvacAytlgHxDVRGDs67NFLsM2GrR2/4sOTMwGq
         qPavmhD40XB3FSgu9g7m9rpaWaIyrMzm0jXhe/kfe+hcKpOiz7TWBu++SDSaN8CqtLNr
         Jydvvb6e5IqLvlXvx0ulj/S/nFRZo1tQKTnEsn/l3HJIYiy7P85KbD4WFmxr/1AuUvQK
         DshZeNbF/owyyLr5OgR/pyaY+OQUxFLF+HZJnOToxm5Vgaocd/NEBfufdcJ17+ahMq8g
         hR+lhvFH5hYyvNL59warXQOqfLCmoG2uDqUmA82xqv+Ty88YZnVk7QUQcKfIuIUAcSAn
         /m6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+h/nBfhCYekwv5tAD3qyul+vGsMzxwv6rAKWgQ9cJJ/pfULZA+
	YOwAlB4Gr6DDXo+UbZJ4GAw=
X-Google-Smtp-Source: AGRyM1vHKAAuIZBHtjmZb0JODaFDl0LkY9O/e1JPTh6OyvzruhjzLWzmilNTki41xMqCgjnxAtAhKA==
X-Received: by 2002:a05:622a:d5:b0:305:abf:dcd6 with SMTP id p21-20020a05622a00d500b003050abfdcd6mr7437306qtw.666.1655452251448;
        Fri, 17 Jun 2022 00:50:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7d90:0:b0:304:ddf4:21ab with SMTP id c16-20020ac87d90000000b00304ddf421abls2665981qtd.10.gmail;
 Fri, 17 Jun 2022 00:50:50 -0700 (PDT)
X-Received: by 2002:a05:622a:64e:b0:305:1aba:c70b with SMTP id a14-20020a05622a064e00b003051abac70bmr7276115qtb.390.1655452250617;
        Fri, 17 Jun 2022 00:50:50 -0700 (PDT)
Date: Fri, 17 Jun 2022 00:50:49 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n@googlegroups.com>
Subject: jailhouse inter-cluster operations
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_938_1154512273.1655452249903"
X-Original-Sender: jdebonfils5@gmail.com
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

------=_Part_938_1154512273.1655452249903
Content-Type: multipart/alternative; 
	boundary="----=_Part_939_1630025517.1655452249903"

------=_Part_939_1630025517.1655452249903
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
I would like to know if jailhouse is able to run on multiple core clusters. 
For example, Imx8 Quad Max has one cluster of 4x Cortex A-53 and another 
cluster of 4x Cortex-A72. 
If so, do you know how Jailhouse manages inter-cluster MMU operations ?

Thank you in advance and have a nice day.

Jean de Bonfils Lavernelle

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%40googlegroups.com.

------=_Part_939_1630025517.1655452249903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,<div>I would like to know if jailhouse is able to run on multip=
le core clusters.&nbsp;</div><div>For example, Imx8 Quad Max has one cluste=
r of 4x Cortex A-53 and another cluster of 4x Cortex-A72.&nbsp;</div><div>I=
f so, do you know&nbsp;how Jailhouse manages inter-cluster MMU operations ?=
</div><div><br></div><div>Thank you in advance and have a nice day.</div><d=
iv><br></div><div>Jean de Bonfils Lavernelle</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1c3da06c-f3f6-479b-a3d4-4e4aa18ca3d7n%40googlegroups.co=
m</a>.<br />

------=_Part_939_1630025517.1655452249903--

------=_Part_938_1154512273.1655452249903--
