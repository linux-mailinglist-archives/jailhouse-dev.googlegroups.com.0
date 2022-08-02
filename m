Return-Path: <jailhouse-dev+bncBCX7HWUSSQARBSXRUOLQMGQEEYL7VXI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A16F587A67
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Aug 2022 12:13:31 +0200 (CEST)
Received: by mail-qk1-x740.google.com with SMTP id m8-20020a05620a24c800b006b5d8eb23efsf11263394qkn.10
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Aug 2022 03:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tMURvOqmnG5X5h+iNP61yl+8ElUjENI9PZODJbA+wMg=;
        b=psxI6mIUhXV5T7CkwHTpuLJ6PgUDHn0KY15B7w43evK3bqg/UGJCfcFOJqyWIOxOGP
         9ygyxrAC3OHf4WQe7AqZqCkP2gUnluBI9QZTE4UN3HDAWlyRveXePhmlb6RKovia0vNW
         blBpzdrEkHuBKJPtkVfLyJK2CQ2+teoC6UByDu0aid/uoezVOg3RNMJNXBoAAZ3ORPOT
         AG8a4GZnBVVJ1qcf5HunE85alo+OS8ulSAiop5IfhEZEuEf0l3Ol1rrY7ETqXvRPYM23
         C8+mYvQBtEtrjaeWoJCB22UQnx2Jywr7dzd0XZRfhWy1V24F2/uK7R4+vV7+LW5Caa3R
         iQQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMURvOqmnG5X5h+iNP61yl+8ElUjENI9PZODJbA+wMg=;
        b=eN9OKTRi+dgxVfKM4/v4pbtt1WW1bBDZorkJuL4HUrLskI0X0B9hf9p4AY39GkNWtd
         /YRGHig/JQSCLtM25IyCVjrr+VP5BpuBmZLqNdi3Vov2kteP6gn8nQVgNB5mOW3Rbqqc
         V3ElfsVgePm25DZ/mXh9k0BlxsoATywMswvJNZGmxzgi2eBNSEJaj95mJqOKiTC+HxJk
         9O4+mnDIB2vzY5XkZuxdEl/UoVlkF5Td40SSTn03OHC/32R8p/laICDNfFF4FtkgyASJ
         Om1jcc+cuSrHxkiX4our8yiP1FRWlmuDveq1pJ3p/77YsrJYJsNAWoquaNq3iQwrtbSY
         WDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tMURvOqmnG5X5h+iNP61yl+8ElUjENI9PZODJbA+wMg=;
        b=flQW3gkLNy2O+yARG4Btg9So3OK+c+IkT+I5K2UOjE7hGpIZxS2hw3XCV0BTGVieDs
         wHLkI/7tHf2VLD7Z41r4uKEMj/6iQhIoVYrk6stgO7IzhlJjNYZv7X/NHskvAR9lCRs4
         FOy9xjSua9nxlpr+f9C9CGbCd1o4SjOYOXbL3ge07JSosJrfTNuvRWMsgM+j/dvbYRwx
         UKRlYGFoyST2WcA/BMJtfc9W9EShGodw3h7/JOEdfajo4d1yADJsGNbH0BdGtA9R1tGB
         5iihT00VFC4/TwdfCS+A9PIAxsOVddGVhk7s7oQwJkd08FgYIp5xH78ohprhJmODt7/B
         dSiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo2GcFraVHkq/X71JDWUa2KmffHum0tdCeM1Ad/xDTJaj5GHLDKK
	dFmu+7cYNRAuGmqMGzDj5fM=
X-Google-Smtp-Source: AA6agR7mkt8dMHHC/BIyRJ7EiXcs6bEZ3ZyJAY4C8dlUl60D7P4c8jBqZl8leMocKQLnOLAfCo+eTg==
X-Received: by 2002:a05:6214:dcc:b0:476:2fdd:13ef with SMTP id 12-20020a0562140dcc00b004762fdd13efmr11822303qvt.111.1659435210422;
        Tue, 02 Aug 2022 03:13:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:ca:b0:304:c381:99a3 with SMTP id
 p10-20020a05622a00ca00b00304c38199a3ls9388095qtw.5.-pod-prod-gmail; Tue, 02
 Aug 2022 03:13:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1897:b0:31f:281b:5d2b with SMTP id v23-20020a05622a189700b0031f281b5d2bmr17678193qtc.508.1659435209472;
        Tue, 02 Aug 2022 03:13:29 -0700 (PDT)
Date: Tue, 2 Aug 2022 03:13:28 -0700 (PDT)
From: Jean de Bonfils <jdebonfils5@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4a7d77f7-fb0c-4986-9df2-57842e389b34n@googlegroups.com>
Subject: Shared L2-Cache use in Jailhouse
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_502_632949765.1659435208811"
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

------=_Part_502_632949765.1659435208811
Content-Type: multipart/alternative; 
	boundary="----=_Part_503_1834711619.1659435208812"

------=_Part_503_1834711619.1659435208812
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

As cells are partitioned along cores and, on my i.MX8 MQ, level 2 cache is 
shared between cores, I would like to know if there are any security issues 
or things to consider related to the use of the L2 cache in Jailhouse. 
Is L2 cache enabled while Jailhouse is running? If so, doesn't this cause 
isolation issues between cells?
Thank you in advance, have a nice day.

Jean,

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4a7d77f7-fb0c-4986-9df2-57842e389b34n%40googlegroups.com.

------=_Part_503_1834711619.1659435208812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone,<div><br><div>As cells are partitioned along cores and, on m=
y i.MX8 MQ, level 2 cache is shared between cores, I would like to know if =
there are any security issues or things to consider related to the use of t=
he L2 cache in Jailhouse.&nbsp;</div><div>Is L2 cache enabled while Jailhou=
se is running? If so,&nbsp;doesn't this cause isolation issues between cell=
s?</div><div>Thank you in advance, have a nice day.</div><div><br></div><di=
v>Jean,</div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4a7d77f7-fb0c-4986-9df2-57842e389b34n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4a7d77f7-fb0c-4986-9df2-57842e389b34n%40googlegroups.co=
m</a>.<br />

------=_Part_503_1834711619.1659435208812--

------=_Part_502_632949765.1659435208811--
